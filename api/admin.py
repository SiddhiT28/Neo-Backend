from django.contrib import admin
from .models import *
from django.utils.html import mark_safe, format_html
from django.contrib.admin.widgets import AdminFileWidget


class WishlistItemInline(admin.TabularInline):
    model = Wishlist
    extra = 0

class AdminImageWidget(AdminFileWidget):

    def render(self, name, value, attrs=None, renderer=None):
        output = []

        if value and getattr(value, "url", None):
            image_url = value.url
            file_name = str(value)

            output.append(
                f'<a href="{image_url}" target="_blank">'
                f'<img src="{image_url}" alt="{file_name}" width="150" height="150" '
                f'style="object-fit: cover;"/> </a>')

        output.append(super(AdminFileWidget, self).render(name, value, attrs, renderer))
        return mark_safe(u''.join(output))



class CartItemInline(admin.TabularInline):
    '''
    This class will add a Inline Cart model wherever it will be used.
    '''

    model = Cart
    extra = 0

class AddressInLine(admin.TabularInline):
    '''
    This class will add a Inline Address model wherever it will be used.
    '''
    model= Address
    extra=1

    def get_user_name(self, obj):
        return obj.user.name

class OrderInline(admin.TabularInline):
    '''
    This class will add a Inline Order model wherever it will be used.
    '''
    model = Order
    extra = 0
        
@admin.register(Person)
class PersonAdmin(admin.ModelAdmin):
    '''
    This class will add a Person model in admin panel. Where Address and Cart Model will be added inline.
    '''


    list_display = ('name', 'email', 'password', 'created_at', 'updated_at', )
    list_filter = ('created_at', 'updated_at')
    search_fields = ('name', 'email', 'password')
    ordering = ('created_at',)
    inlines = [AddressInLine, CartItemInline, OrderInline, WishlistItemInline]


class ProductImageInline(admin.TabularInline):
    '''
    This class will add a Inline ProductImage model wherever it will be used.
    '''

    formfield_overrides = {models.ImageField: {'widget': AdminImageWidget}}

    list_display = ('image_tag',)

    model = ProductImage
    extra = 1

@admin.register(Product)
class ProductAdmin(admin.ModelAdmin):
    '''
    This class will add a Product model in admin panel. Where ProductImage Model will be added inline.
    '''
    list_display = ('name', 'description', 'price', 'brand', 'category', 'numberOfProducts', 'created_at', 'updated_at', )
    list_filter = ('created_at', 'updated_at')
    search_fields = ('id', 'name', 'description', 'price', 'brand', 'category', 'numberOfProducts')
    ordering = ('created_at',)
    inlines = [ProductImageInline]


@admin.register(BannerAdd)
class BannerAdmin(admin.ModelAdmin):
    '''
    This class will add a Banner model in admin panel. Where Product Model will be added inline.
    '''
    list_display = ('image', 'created_at', 'updated_at')
    list_filter = ('created_at', 'updated_at')
    search_fields = ('image',)
    ordering = ('created_at',)

@admin.register(Retailer)
class RetailerAdmin(admin.ModelAdmin):
    '''
    This class will add a Retailer model in admin panel. Where Product Model will be added inline.
    '''
    list_display = ('name', 'email', 'password', 'created_at', 'updated_at')
    list_filter = ('created_at', 'updated_at')
    search_fields = ('name', 'email', 'password')
    ordering = ('created_at',)
    

