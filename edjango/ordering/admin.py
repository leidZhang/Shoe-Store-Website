from django.contrib import admin

# Register your models here.
from ordering.models import Order, OrderItem


class OrderItemAdmin(admin.ModelAdmin):
    list_display = ['order_date', 'order_id', 'get_product', 'get_color', 'get_size', 'quantity', 'history_total']

    def order_date(self, obj):
        return obj.order.date

    def order_id(self, obj):
        return obj.order.id

    def history_total(self, obj):
        return obj.inventory.product.price * obj.quantity

    def get_product(self, obj):
        return obj.inventory.product

    def get_color(self, obj):
        return obj.inventory.color

    def get_size(self, obj):
        return obj.inventory.size

    order_date.short_description = 'Order Date'
    order_id.short_description = 'Order ID'
    get_product.short_description = 'Product'
    get_color.short_description = 'Color'
    get_size.short_description = 'Size'
    history_total.short_description = 'Total'


class OrderItemInline(admin.TabularInline):
    model = OrderItem
    extra = 0  # no extra empty rows
    readonly_fields = [field.name for field in OrderItem._meta.get_fields()]  # all read only
    can_delete = False  # hide delete button
    max_num = 0  # hide add button

    def has_add_permission(self, request, obj=None):
        return False  # cannot add existed items

    def has_delete_permission(self, request, obj=None):
        return False  # cannot delete existed items


class OrderAdmin(admin.ModelAdmin):
    inlines = [OrderItemInline]
    readonly_fields = ('total', )
    list_display = ('customer', 'phone_num', 'date', 'city', 'province', 'total', 'status')


admin.site.register(Order, OrderAdmin)
admin.site.register(OrderItem, OrderItemAdmin)
