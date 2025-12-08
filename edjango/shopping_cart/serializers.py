from rest_framework import serializers

from .models import Cart, CartItem
from catalog.models import Inventory
from catalog.serializers import InventorySerializer


class CartItemSerializer(serializers.ModelSerializer):
    # read only product, read via product detail
    inventory = InventorySerializer(many=False, read_only=True)
    # write only product_id, add via product id
    inventory_id = serializers.PrimaryKeyRelatedField(queryset=Inventory.objects.all(), source='inventory', write_only=True)
    # read only id, identify the cartItem
    id = serializers.IntegerField(read_only=True)

    class Meta:
        model = CartItem
        fields = ['id', 'inventory_id', 'inventory', 'quantity']


class CartSerializer(serializers.ModelSerializer):
    inventories = CartItemSerializer(many=True, read_only=True, source='inventory_set')

    class Meta:
        model = Cart
        fields = ['customer_id', 'inventories', 'total']

