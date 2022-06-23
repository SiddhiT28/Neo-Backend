from django.urls import path
from .views import  *

# URL configurations
urlpatterns = [
    path('routes/', getRoutes, name='getRoutes'),
    path('user/update', get_user_by_id, name='get_user_by_id'),
    path('user/changePassword', update_user_password, name='get_user_by_id'),
    path('user/login', get_user_by_email_and_password, name='valid-user'),
    path('user/register', register_user, name='register-user'),
    path('user/addAddress', add_user_address, name='add-address'),
    path('user/deleteAddress', delete_user_address, name='get-address'),
    path('products/all', get_all_products, name='get-all-products'),
    path('product/category', get_product_by_category, name='get-all-products'),
    path('product/search', get_searched_products, name='get-searched-products'),
    path('product/getOne', get_single_product, name="get-single-product"),
    path('product/update', update_product, name="update-product"),
    path('product/add', add_new_product, name="add-new-product"),
    path('add/banner', get_banner_images, name="get-banner"),
    path('user/cart/add', add_product_to_cart, name="add-product-to-cart"),
    path('user/cart/update', update_cart_product_quantity, name="update-quantity"),
    path('user/cart/remove', remove_product_from_cart, name="delete-product-from-cart"),
    path('user/wishlist', user_wishlist, name="user-wishlist"),
    path('order/payment', payment_gateway, name="payment-gateway"),
    path('order/payment/callback', payment_callback, name="payment-callback"),
    path('vendor/login', get_vendor_by_email_password, name="get-vendor-by-email-and-password"),
    path('vendor/register', register_vendor, name="register-vendor"),
    # path('vendor/addProduct', add_product_to_vendor, name="add-product-to-vendor"),
    # path('vendor/updateProduct', update_product_in_vendor, name="update-product-in-vendor"),
    # path('vendor/deleteProduct', delete_product_from_vendor, name="delete-product-from-vendor"),
    path('vendor/getProducts', get_vendor_products, name="get-products-by-vendor"),
    path('vendor/getById', vendor_details, name="get-single-product-by-vendor"),
    path('vendor/getProducts/ordered', get_vendor_product_orders, name="get-vendor-product-orders"),
]