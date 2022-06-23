from distutils.command.upload import upload
from django.db import models


def upload_to(instance, filename):
    return 'images/{filename}'.format(filename=filename)


class Wishlist(models.Model):
    customer = models.ForeignKey('Person', on_delete=models.CASCADE, related_name='wishlist')
    products = models.ManyToManyField('Product', related_name='wishlist')
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)


class Person(models.Model):
    name = models.CharField(max_length=100)
    email = models.EmailField(max_length=100)
    password = models.CharField(max_length=100)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)


class Retailer(models.Model):
    name = models.CharField(max_length=100)
    email = models.EmailField(max_length=100)
    password = models.CharField(max_length=100)
    phonenumbers = models.IntegerField()
    companyName = models.CharField(max_length=100)
    companyAddress = models.CharField(max_length=100)
    bankDetails = models.CharField(max_length=100)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)


class Address(models.Model):
    user = models.ForeignKey(Person, on_delete=models.CASCADE, default=None, related_name='addresses')
    name = models.CharField(max_length=100)
    street=models.CharField(max_length=100)
    city=models.CharField(max_length=100)
    state=models.CharField(max_length=100)
    zipcode=models.CharField(max_length=100)
    

class Product(models.Model):
    name = models.CharField(max_length=100)
    description = models.TextField()
    price = models.FloatField()
    brand = models.CharField(max_length=100)
    category = models.CharField(max_length=100)
    numberOfProducts = models.IntegerField()
    vendor = models.ForeignKey(Retailer, on_delete=models.CASCADE, default=None, related_name='vendors')
    discounts = models.FloatField(default=0)
    sale = models.IntegerField(default=0)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    
    def isAvaliable(self):
        if self.numberOfProducts > 0:
            return True
        else:
            return self.numberOfProducts
    
    def isOnSale(self):
        if self.sale > 100:
            return True
        else:
            return self.sale

class ProductImage(models.Model):
    image = models.ImageField(upload_to=upload_to, default='images/default.png')
    product = models.ForeignKey(Product, on_delete=models.CASCADE, related_name='images', default=None)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    

    def get_display_url(self):
        return self.image.url

class Cart(models.Model):
    user = models.ForeignKey(Person, on_delete=models.CASCADE, related_name='cart')
    product = models.ForeignKey(Product, on_delete=models.CASCADE, related_name='cart')
    quantity = models.IntegerField()
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def totalPrice(self):
        return self.product.price * self.quantity
    
class Order(models.Model):
    user = models.ForeignKey(Person, on_delete=models.CASCADE, related_name='order')
    products = models.ForeignKey(Product, on_delete=models.CASCADE, related_name='ordered_product')
    amount = models.FloatField(default=0)
    quantity = models.IntegerField(default=1)
    provider_order_id = models.CharField(max_length=100, default=None)
    status = models.CharField(max_length=100, default='Pending')
    signature_id = models.CharField(max_length=100, default=None)
    address = models.ForeignKey(Address, on_delete=models.CASCADE)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def totalPrice(self):
        return self.product.price * self.quantity

class Review(models.Model):
    user = models.ForeignKey(Person, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    review = models.TextField()
    rating = models.IntegerField()
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

class BannerAdd(models.Model):
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    image = models.ImageField(upload_to='images/', default='images/default.png')
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)


