from django.db import models

# Create your models here.
from catalog.models import Inventory
from identity.models import Customer


class Cart(models.Model):
    customer = models.OneToOneField(Customer, on_delete=models.CASCADE, primary_key=True)
    inventories = models.ManyToManyField(Inventory, through='CartItem')
    total = models.DecimalField(max_digits=6, decimal_places=2, default=0.00)

    def __str__(self):
        return str(self.customer.username)

    def update_total(self):
        cart_items = CartItem.objects.filter(cart=self)
        total = sum(item.quantity * item.inventory.product.price for item in cart_items)

        self.total = total
        self.save()


class CartItem(models.Model):
    cart = models.ForeignKey(Cart, on_delete=models.CASCADE)
    inventory = models.ForeignKey(Inventory, on_delete=models.CASCADE)
    quantity = models.IntegerField(default=1)

    def __str__(self):
        return 'inventory'
