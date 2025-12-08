from django.contrib import admin
from .models import Inventory


class InventoryAdmin(admin.ModelAdmin):
    list_display = ('product', 'size', 'color', 'stock')


# Register your models here.
admin.site.register(Inventory, InventoryAdmin)
