from django.contrib import admin
from .models import Category, Brand, Product, Color, Size


class ProductAdmin(admin.ModelAdmin):
    list_display = ('id', 'title', 'brand', 'category', 'price')


# Register your models here.
admin.site.register(Category)
admin.site.register(Brand)
admin.site.register(Product, ProductAdmin)
admin.site.register(Color)
admin.site.register(Size)
