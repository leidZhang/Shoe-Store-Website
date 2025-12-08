from django.contrib import admin
from .models import CustomerInfo, Customer
from ordering.admin import Order, OrderItem


class CustomerInfoInline(admin.StackedInline):
    model = CustomerInfo
    fields = ('phone_num', 'address_2', 'address_1', 'city', 'province', 'postal_code')
    extra = 1


class OrderInline(admin.TabularInline):
    model = Order
    fields = ('date', 'status', 'total', 'payment_method')
    extra = 0
    show_change_link = True


class CustomerAdmin(admin.ModelAdmin):
    list_display = ('username', 'first_name', 'last_name', 'get_phone_num', 'get_address_2',
                    'get_address_1', 'get_city', 'get_province', 'get_postal_code')
    inlines = [CustomerInfoInline, OrderInline]

    def get_phone_num(self, obj):
        # Assuming that each customer has only one related CustomerInfo instance
        customer_info = CustomerInfo.objects.filter(customer=obj).first()
        return customer_info.phone_num if customer_info else None
    get_phone_num.short_description = 'Phone Number'

    def get_address_2(self, obj):
        # Assuming that each customer has only one related CustomerInfo instance
        customer_info = CustomerInfo.objects.filter(customer=obj).first()
        return customer_info.address_2 if customer_info else None
    get_address_2.short_description = 'Address 2'

    def get_address_1(self, obj):
        # Assuming that each customer has only one related CustomerInfo instance
        customer_info = CustomerInfo.objects.filter(customer=obj).first()
        return customer_info.address_1 if customer_info else None
    get_address_1.short_description = 'Address 1'

    def get_city(self, obj):
        # Assuming that each customer has only one related CustomerInfo instance
        customer_info = CustomerInfo.objects.filter(customer=obj).first()
        return customer_info.city if customer_info else None
    get_city.short_description = 'City'

    def get_province(self, obj):
        # Assuming that each customer has only one related CustomerInfo instance
        customer_info = CustomerInfo.objects.filter(customer=obj).first()
        return customer_info.province if customer_info else None
    get_province.short_description = 'Province'

    def get_postal_code(self, obj):
        # Assuming that each customer has only one related CustomerInfo instance
        customer_info = CustomerInfo.objects.filter(customer=obj).first()
        return customer_info.postal_code if customer_info else None
    get_postal_code.short_description = 'Postal Code'


admin.site.register(Customer, CustomerAdmin)

