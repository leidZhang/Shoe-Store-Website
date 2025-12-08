from rest_framework import generics, status
from rest_framework.response import Response
from django.shortcuts import render, get_object_or_404

# Create your views here.
from shopping_cart.models import Cart, CartItem
from .serializers import CartSerializer, CartItemSerializer


class CartView(generics.ListCreateAPIView):
    queryset = Cart.objects.all()
    serializer_class = CartSerializer
    pagination_class = None

    def get_queryset(self):
        user = self.request.user
        return Cart.objects.filter(customer_id=user.id)


class CartItemView(generics.ListCreateAPIView):
    queryset = CartItem.objects.all()
    serializer_class = CartItemSerializer
    pagination_class = None

    def get_queryset(self):
        user = self.request.user
        return CartItem.objects.filter(cart_id=user.id)

    def perform_create(self, serializer):
        # Set the cart field before saving the instance
        user = self.request.user  # cart_id is user_id
        inventory_id = self.request.data.get('inventory_id')
        quantity = self.request.data.get('quantity')
        cart = Cart.objects.get(customer_id=user.id)

        # Check if the item already exists in the cart
        existing_item = CartItem.objects.filter(cart=user.id, inventory=inventory_id).first()

        if existing_item:
            # If the item exists, update the quantity
            existing_item.quantity += int(quantity)
            existing_item.save()
            serializer.instance = existing_item  # Set the serializer instance for response
            cart_item_id = existing_item.id
        else:
            # If the item does not exist, create a new one
            serializer.save(cart_id=user.id)
            cart_item_id = serializer.instance.id

        # update the total price
        cart.update_total()

        # Return the response with the cart_item id
        response_data = {'cart_item_id': cart_item_id}
        return Response(response_data, status=status.HTTP_201_CREATED)


class SingleCartItemView(generics.RetrieveUpdateDestroyAPIView):
    queryset = CartItem.objects.all()
    serializer_class = CartItemSerializer

    def get_queryset(self):
        cart = self.get_object()
        return CartItem.objects.filter(cart=cart)

    def get_object(self):
        cart_item = CartItem.objects.all()
        filter_kwargs = {'pk': self.kwargs['pk']}
        obj = get_object_or_404(cart_item, **filter_kwargs)
        return obj

    def perform_update(self, serializer):
        instance = serializer.save()
        # Update the shopping cart's total price when a cart item is updated
        cart = instance.cart
        cart.update_total()

    def perform_destroy(self, instance):
        # Delete the cart item
        instance.delete()
        # Update the shopping cart's total price when a cart item is deleted
        cart = instance.cart
        cart.update_total()
