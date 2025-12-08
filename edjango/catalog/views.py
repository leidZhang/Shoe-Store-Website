from rest_framework import generics

from .models import Inventory
from .serializers import InventorySerializer


# Create your views here.
class InventoryView(generics.ListAPIView):
    queryset = Inventory.objects.all()
    serializer_class = InventorySerializer
    pagination_class = None


class InventoryByProductIDView(generics.ListCreateAPIView):
    serializer_class = InventorySerializer
    pagination_class = None

    def get_queryset(self):
        product_id = self.kwargs['product_id']
        queryset = Inventory.objects.filter(product=product_id)

        return queryset





