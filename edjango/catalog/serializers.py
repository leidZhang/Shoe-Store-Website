from rest_framework import serializers
from .models import Inventory
from data_access.models import Color, Size, Product
from data_access.serializers import ColorSerializer, SizeSerializer, ProductSerializer


class InventorySerializer(serializers.ModelSerializer):
    color = ColorSerializer(read_only=True)
    size = SizeSerializer(read_only=True)
    product = ProductSerializer(read_only=True)
    color_id = serializers.PrimaryKeyRelatedField(queryset=Color.objects.all(), source='color', write_only=True)
    size_id = serializers.PrimaryKeyRelatedField(queryset=Size.objects.all(), source='size', write_only=True)
    product_id = serializers.PrimaryKeyRelatedField(queryset=Product.objects.all(), source='product', write_only=True)

    class Meta:
        model = Inventory
        fields = ['id', 'stock', 'color', 'color_id', 'product', 'product_id', 'size', 'size_id']



