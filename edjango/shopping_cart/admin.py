from django.contrib import admin

# Register your models here.
from shopping_cart.models import Cart, CartItem


class CartItemInline(admin.TabularInline):
    model = CartItem
    extra = 1


class CartAdmin(admin.ModelAdmin):
    inlines = [CartItemInline]
    list_display = ('customer', 'total')


admin.site.register(Cart, CartAdmin)
