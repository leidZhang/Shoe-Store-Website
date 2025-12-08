from rest_framework import serializers
from django.contrib.auth.models import User
from django.contrib.auth import authenticate

from catalog.models import Inventory
from catalog.serializers import InventorySerializer
from .models import Order, OrderItem


class OrderItemSerializer(serializers.ModelSerializer):
    inventory = InventorySerializer(many=False, read_only=True)

    class Meta:
        model = OrderItem
        fields = ['inventory', 'quantity']


class OrderSerializer(serializers.ModelSerializer):
    inventories = OrderItemSerializer(many=True, read_only=True, source='inventory_set')

    class Meta:
        model = Order
        fields = ['id', 'customer_id', 'inventories', 'status',
                  'total', 'date', 'first_name', 'last_name',
                  'phone_num', 'address_1', 'address_2', 'city',
                  'province', 'postal_code', 'payment_method'
                  ]
