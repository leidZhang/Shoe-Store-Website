from django.db import models

# Create your models here.
from catalog.models import Inventory
from identity.models import Customer


class Order(models.Model):
    STATUS_CHOICES = [
        ('processing', 'Processing'),
        ('shipped', 'Shipped'),
        ('delivered', 'Delivered'),
        ('canceled', 'Canceled'),
    ]

    # basic info
    customer = models.ForeignKey(Customer, on_delete=models.DO_NOTHING)
    inventories = models.ManyToManyField(Inventory, through='OrderItem')
    total = models.DecimalField(max_digits=6, decimal_places=2, default=0.00)
    date = models.DateField(db_index=True)
    status = models.CharField(max_length=255, choices=STATUS_CHOICES, default="processing")
    # address info
    first_name = models.CharField(max_length=255, default="")
    last_name = models.CharField(max_length=255, default="")
    phone_num = models.CharField(max_length=10, default="")
    address_1 = models.CharField(max_length=255, default="")
    address_2 = models.CharField(max_length=255, default="")
    city = models.CharField(max_length=255, default="")
    province = models.CharField(max_length=2, default="")
    postal_code = models.CharField(max_length=7, default="")
    # payment info
    payment_method = models.CharField(max_length=255, default="")

    def __str__(self):
        return str(self.id)


class OrderItem(models.Model):
    order = models.ForeignKey(Order, on_delete=models.CASCADE)
    inventory = models.ForeignKey(Inventory, on_delete=models.CASCADE)
    quantity = models.IntegerField(default=1)

    class Meta:
        verbose_name = 'Sale History'

    def __str__(self):
        return 'inventory'
