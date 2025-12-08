from django.db import models
from django.contrib.auth.models import Group, UserManager
from django.contrib.auth import get_user_model


# Create your models here.
class AdministratorManager(models.Manager):
    def get_queryset(self):
        administrator_group = Group.objects.get(name="Administrator")
        return super().get_queryset().filter(groups=administrator_group)


class Administrator(get_user_model()):
    class Meta:
        proxy = True

    objects = AdministratorManager()


class CustomerManager(UserManager):
    def get_queryset(self):
        customer_group = Group.objects.get(name='Customer')
        return super().get_queryset().filter(groups=customer_group)


class CustomerInfo(models.Model):
    customer = models.OneToOneField('Customer', primary_key=True, on_delete=models.CASCADE)
    phone_num = models.CharField(max_length=10, default="")
    address_1 = models.CharField(max_length=255, default="")
    address_2 = models.CharField(max_length=255, default="", blank=True)
    city = models.CharField(max_length=255, default="")
    province = models.CharField(max_length=2, default="")
    postal_code = models.CharField(max_length=7, default="")


class Customer(get_user_model()):
    class Meta:
        proxy = True

    objects = CustomerManager()
