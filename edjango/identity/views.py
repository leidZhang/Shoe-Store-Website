from rest_framework import generics
from rest_framework.permissions import IsAuthenticated

# Create your views here.
from .models import CustomerInfo
from .serializers import CustomerInfoSerializer


class CustomerInfoView(generics.RetrieveUpdateAPIView):
    queryset = CustomerInfo.objects.all()
    serializer_class = CustomerInfoSerializer
    pagination_class = None
    permission_classes = [IsAuthenticated]

    def get_object(self):
        return CustomerInfo.objects.get(customer=self.request.user)
