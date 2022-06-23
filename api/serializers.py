from rest_framework import serializers
from .models import *

class WishlistSerializer(serializers.ModelSerializer):
    class Meta:
        model = Wishlist
        fields = '__all__'

class OrderSerializer(serializers.ModelSerializer):
    class Meta:
        model = Order
        fields = '__all__'

class CartSerializer(serializers.ModelSerializer):
    '''
    Serializer for Cart model. Returns JSON data.
    '''
    class Meta:
        model = Cart
        fields = '__all__'

class AddressSerializer(serializers.ModelSerializer):
    '''
    Serializer for Address model. Convert address object to JSON format
    '''
    class Meta:
        model = Address
        fields = '__all__'

class UserSerializer(serializers.ModelSerializer):
    '''
    Serializer for Person model. Convert user object to JSON format and append address object and cart object.
    '''

    addresses = AddressSerializer(many=True)
    cart = CartSerializer(many=True)
    order = OrderSerializer(many=True)
    wishlist = WishlistSerializer(many=True)

    class Meta:
        model = Person
        fields = ('id','name', 'email', 'password', 'addresses', 'cart', 'order', 'wishlist')


class ProductImageSerializer(serializers.ModelSerializer):
    '''
    Serializer for ProductImage model. Convert product image object to JSON format.
    '''
    class Meta:
        model = ProductImage
        fields = ('id', 'image')

class ProductSerializer(serializers.ModelSerializer):
    '''
    Serializer for Product model. Convert product object to JSON format and append product image object.
    '''
    images = ProductImageSerializer(many=True)

    class Meta:
        model = Product
        fields = ('id', 'name', 'description', 'price', 'brand', 'category', 'numberOfProducts', 'images', 'discounts')


class BannerSerializer(serializers.ModelSerializer):
    '''
    Serializer for Banner model. Convert banner object to JSON format.
    '''
    product = ProductSerializer()
    class Meta:
        model = BannerAdd
        fields = ('id', 'image', 'product')


class RetailerSerializer(serializers.ModelSerializer):
    '''
    Serializer for Retailer model. Convert retailer object to JSON format.
    '''
    class Meta:
        model = Retailer
        fields = '__all__'