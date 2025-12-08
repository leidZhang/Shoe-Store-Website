from djoser.signals import user_registered
from django.contrib.auth.models import Group
from .models import CustomerInfo
from shopping_cart.models import Cart


def add_user_to_group(sender, user, request, **kwargs):
    group, created = Group.objects.get_or_create(name="Customer")
    user.groups.add(group)
    user.save()

    # create related Cart and CustomerInfo
    CustomerInfo.objects.create(customer=user)
    Cart.objects.create(customer=user)


user_registered.connect(add_user_to_group)  # assign to customer
