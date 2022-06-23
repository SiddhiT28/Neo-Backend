from csv import field_size_limit
import json
from math import prod

from urllib3 import HTTPResponse
from neo_be.settings import RAZORPAY_KEY_ID, RAZORPAY_KEY_SECRET
from rest_framework.response import Response
from rest_framework.decorators import api_view
from rest_framework.parsers import MultiPartParser, FormParser
from django.contrib.auth.hashers import make_password, check_password
from django.views.decorators.csrf import csrf_exempt
from django.http import JsonResponse
from django.shortcuts import redirect, render
from api.serializers import *
from .models import *
import razorpay
import uuid


@api_view(['GET', 'POST'])
def update_user_password(request):
    if request.method == 'POST':
        data = request.data
        user = Person.objects.get(id=data['id'])
        if check_password(data['old_password'], user.password):
            user.password = make_password(data['new_password'])
            user.save()
            return Response({"message": "Password updated successfully", "success": True})
        else:
            return Response({"message": "Old password is incorrect", "success" : False})
    else:
        return Response({"message": "Method not allowed"})



@api_view(['GET', 'POST', 'DELETE'])
def user_wishlist(request):
    if request.method == 'GET':
        user = Person.objects.get(id=request.GET['user_id'])
        wishlist = Wishlist.objects.filter(customer=user)
        serializer = WishlistSerializer(wishlist, many=True)
        return Response(serializer.data)
    elif request.method == 'POST':
        product_id = request.data['productId']
        user_id = request.data['userId']
        customer = Person.objects.get(id=user_id)
        product = Product.objects.get(id=product_id)
        wishlist, wishlist_created = Wishlist.objects.get_or_create(customer=customer)
        print(wishlist_created)
        if wishlist_created is False:
            wishlist.products.add(product)
            wishlist.save()
            return Response({"message": 'Product added to wishlist'})
        else:
            serializer = WishlistSerializer(wishlist)
            return Response(serializer.data)

    elif request.method == 'DELETE':
        user = Person.objects.get(id=request.GET['userId'])
        product = Product.objects.get(id=request.GET['productId'])
        user_wishlist = Wishlist.objects.get(customer=user)
        user_wishlist.products.remove(product)
        serializer = WishlistSerializer(user_wishlist)
        return Response(serializer.data)


@api_view(['POST'])
def payment_gateway(request):
    if request.method == 'POST':
        user = request.data['user']
        amount = request.data['amount']
        address = request.data['address']
        products = json.loads(request.data['products'])
        
        client = razorpay.Client(auth=(RAZORPAY_KEY_ID, RAZORPAY_KEY_SECRET))
        order_id = str(uuid.uuid4())

        razorpay_order = client.order.create(dict(
            amount=int(amount) * 100,
            currency='INR',
            receipt=order_id, 
            payment_capture='1',
            ))

        

        for product in products:
            product_obj = Product.objects.get(id=product['id'])
            quantity = product['quantity']
            product_obj.numberOfProducts -= quantity
            product_obj.sale += 1
            product_obj.save()

            


            order_product = Order.objects.create(
            user=Person.objects.get(id=user),
            products=product_obj,
            amount=amount,
            quantity=quantity,
            provider_order_id=razorpay_order['id'],
            signature_id=order_id,
            address=Address.objects.get(id=address)
            )
            order_product.save()
            
        return Response({"order_id": order_product.provider_order_id, "": order_product.amount})


@csrf_exempt
def payment_callback(request):
    def verify_signature(response_data):
        client = razorpay.Client(auth=(RAZORPAY_KEY_ID, RAZORPAY_KEY_SECRET))
        return client.utility.verify_payment_signature(response_data)

    if "razorpay_signature" in request.POST:
        payment_id = request.POST.get("razorpay_payment_id", "")
        provider_order_id = request.POST.get("razorpay_order_id", "")
        signature_id = request.POST.get("razorpay_signature", "")
        order = Order.objects.filter(provider_order_id=provider_order_id)
        order.update(signature_id = signature_id)
        if verify_signature(request.POST) == True:
            user = Person.objects.filter(order=order[0]).first()
            cart = Cart.objects.filter(user=user)
            if cart:
                cart.delete()
            order.update(status="Success")
            return redirect('http://localhost:3000/orderCallback')
        else:
            order.update(status="Failed")
            return JsonResponse({"status": order.status})
    else:
        payment_id = request.POST.get("razorpay_payment_id", "")
        provider_order_id = request.POST.get("razorpay_order_id", "")
        order = Order.objects.get(provider_order_id=provider_order_id)
        order.payment_id = payment_id
        order.update(status="Failed")
        return json({"status": order.status})

@api_view(['POST'])
def get_user_by_id(request):
    '''
        If user id is stored in sessions.
        This function will be called to get user details.
    '''
    if request.method == 'POST':
        user_id = request.data['id']
        user = Person.objects.get(id=user_id)
        serializer = UserSerializer(user)
        return Response(serializer.data)


@api_view(['POST'])
def get_user_by_email_and_password(request):
    '''
        This function is for login functionality.
    '''
    if request.method == 'POST':
        email = request.data['email']
        encrypted_password = make_password(request.data['password'])
        user = Person.objects.get(email=email)
        if(check_password(request.data['password'], user.password)):
            serializer = UserSerializer(user)
            return Response(serializer.data)
        
        return Response({'error': 'Wrong password', 'isInValid': True})


@api_view(['POST'])
def register_user(request):
    '''
        This function is for register functionality.
    '''
    if request.method == 'POST':
        data = request.data
        name = data['name']
        email = data['email']
        password = make_password(data['password'])
        user = Person.objects.create(
            email=email, 
            password=password, 
            name=name
            )
        serializer = UserSerializer(user)
        return Response(serializer.data)


@api_view(['POST'])
def add_user_address(request):
    '''
    Adding address to user.
    '''
    if request.method == 'POST':
        data = request.data
        user = Person.objects.get(email=data['email'])
        address = Address.objects.create(
            user=user,
            name=data['name'],
            street=data['street'],
            city=data['city'],
            state=data['state'],
            zipcode=data['zip']
            )
        serializer = AddressSerializer(address)
        return Response(serializer.data)


@api_view(['POST'])
def get_user_address(request):
    '''
    Getting address of user.
    '''
    if request.method == 'POST':
        data = request.data
        user = Person.objects.get(email=data['email'])
        address = Address.objects.filter(user=user)
        serializer = AddressSerializer(address, many=True)
        return Response(serializer.data)


@api_view(['POST'])
def delete_user_address(request):
    '''
    Deleting address of user.
    '''
    if request.method == 'POST':
        data = request.data
        address = Address.objects.get(id=data['id'])
        address.delete()
        return Response(status=200)


@api_view(['POST'])
def add_new_product(request):
    '''
    Adding product to database.
    '''
    if request.method == 'POST':
        data = request.data
        parser_classes = (MultiPartParser, FormParser)
        vendor = Retailer.objects.get(id=data['createdBy'])
        product = Product.objects.create(
            name=data['name'],
            price=data['amount'],
            description=data['description'],
            category=data['category'],
            numberOfProducts=data['stock'],
            vendor=vendor
            )

        productImage = ProductImage.objects.create(
            product=product,
            image=data['image']
            )
        serializer = ProductSerializer(product)
        return Response(serializer.data)


@api_view(['get'])
def get_all_products(request):
    '''
        Getting all avaliable products from database.
    '''
    if request.method == 'GET':
        products = Product.objects.all()
        serializer = ProductSerializer(products, many=True)
        return Response(serializer.data)

@api_view(['POST'])
def get_product_by_category(request):
    if request.method == 'POST':
        category = request.data['category']
        product = Product.objects.filter(category__contains=category)
        response = ProductSerializer(product, many=True)
        return Response(response.data)

@api_view(['get'])
def get_single_product(request):
    '''
        Getting single product from database on the basis of id.
    '''
    if request.method == 'GET':
        product_id = request.GET['id']
        product = Product.objects.get(id=product_id)
        serializer = ProductSerializer(product)
        return Response(serializer.data)

@api_view(['POST'])
def update_product(request):
    if request.method == 'POST':
        data = request.data
        product = Product.objects.filter(id=data['id']).update(
            name=data['name'],
            price=data['price'],
            description=data['description'],
            discounts=data['discount'],
            numberOfProducts=data['numberOfProducts']
            )

        return Response(status=200)

def searchMatch(query, item):
    if query.lower() in item.name.lower() or query.lower() in item.description.lower() or query.lower() in item.category.lower() or query.lower() in item.brand.lower():
        return True
    else:
        return False


@api_view(['POST'])
def get_searched_products(request):
    '''
        Getting result for searched products. 
    '''
    if request.method == 'POST':
        data = request.data
        query = data['searchKey']
        if query != '':
            temp_product = Product.objects.all()
            products = [item for  item in temp_product if searchMatch(query, item)]
            print(request.data)
            print(products)
            serializer = ProductSerializer(products, many=True)
            return Response(serializer.data)


@api_view(['post'])
def add_product_to_cart(request):
    '''
    Adding product to cart.
    '''
    if(request.method) == 'POST':
        data = request.data
        user = Person.objects.get(id=data['userId'])
        product = Product.objects.get(id=data['productId'])
        cart = Cart.objects.create(
            user=user,
            product=product,
            quantity=1
            )
        return Response({"message":"Product added to cart successfully"})

@api_view(['POST'])
def update_cart_product_quantity(request):
    '''
    Updating cart product quantity.
    '''
    if(request.method) == 'POST':
        data = request.data
        cart = Cart.objects.filter(id=data['id']).update(
            quantity=data['quantity']
            )
        return Response({"message":"Product quantity updated successfully"})

@api_view(['POST'])
def remove_product_from_cart(request):
    '''
    Removing product from cart.
    '''
    if(request.method) == 'POST':
        data = request.data
        cart = Cart.objects.get(id=data['id'])
        cart.delete()
        return Response({"message":"Product removed from cart successfully"})

@api_view(['GET'])
def get_banner_images(request):
    '''
    Getting all banner images.
    '''
    if(request.method) == 'GET':
        images = BannerAdd.objects.all()
        serializer = BannerSerializer(images, many=True)
        return Response(serializer.data)

@api_view(['POST'])
def register_vendor(request):
    '''
    Registering vendor.
    '''
    if(request.method) == 'POST':
        data = request.data
        retailer = Retailer.objects.create(
            name=data['name'],
            email=data['email'],
            password=make_password(data['password']),
            phonenumbers = data['phonenumber']
            )
        serializer = RetailerSerializer(retailer)
        return Response(serializer.data)

@api_view(['POST'])
def get_vendor_by_email(request):
    '''
    Getting vendor by email.
    '''
    if(request.method) == 'POST':
        data = request.data
        retailer = Retailer.objects.get(email=data['email'])
        serializer = RetailerSerializer(retailer)
        return Response(serializer.data)


@api_view(['GET','POST'])
def vendor_details(request):
    if request.method == 'GET':
        data = request.data
        retailer = Retailer.objects.get(id=request.GET['id'])
        serializer = RetailerSerializer(retailer)
        return Response(serializer.data)
    if(request.method) == 'POST':
        data = request.data
        retailer = Retailer.objects.get(id=data['id'])
        retailer.name = data['name']
        retailer.email = data['email']
        retailer.phonenumbers = data['phonenumbers']
        retailer.companyName = data['companyName']
        retailer.companyAddress = data['companyAddress']
        retailer.bankDetails = data['bankDetails']
        retailer.save()

        serializer = RetailerSerializer(retailer)
        return Response({"message":"Vendor details updated successfully"})


@api_view(['POST'])
def get_vendor_by_email_password(request):
    '''
    Getting vendor by email and password.
    '''
    if(request.method) == 'POST':
        data = request.data
        retailer = Retailer.objects.get(email=data['email'])
        print(make_password(data['password']))
        if check_password(data['password'], retailer.password):
            print("Password matched")
            serializer = RetailerSerializer(retailer)
            return Response(serializer.data)
        else:
            return Response({"message":"Invalid Password"})


@api_view(['POST'])
def get_vendor_products(request):
    '''
    Getting vendor products.
    '''
    if(request.method) == 'POST':
        data = request.data
        retailer = Retailer.objects.get(id=data['id'])
        products = Product.objects.filter(vendor=retailer)
        serializer = ProductSerializer(products, many=True)
        return Response(serializer.data)


@api_view(['POST'])
def get_vendor_product_orders(request):
    if request.method == 'POST':
        data = request.data
        retailer = Retailer.objects.get(id=data['id'])
        products = Product.objects.filter(vendor=retailer)
        orders = Order.objects.filter(products__in=products)
        serializer = OrderSerializer(orders, many=True)
        return Response(serializer.data)



@api_view(['GET', 'POST'])
def getRoutes(request):
    '''
    Displaying all routes.
    '''
    routes = [
        {
            'path': '/api/user/login',
            'method': 'POST',
            'description': 'Get all users'
        },
        {
            'path': '/api/users/<int:id>',
            'method': 'GET',
            'description': 'Get user by id'
        },
        {
            'path': '/api/users',
            'method': 'POST',
            'description': 'Create a new user'
        },
        {
            'path': '/api/users/<int:id>',
            'method': 'PUT',
            'description': 'Update a user'
        },
    ]
    return Response(routes)
