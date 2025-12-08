from django.db import models
from data_access.models import Product, Size, Color


# Create your models here.
class Inventory(models.Model):
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    size = models.ForeignKey(Size, on_delete=models.CASCADE)
    color = models.ForeignKey(Color, on_delete=models.CASCADE)
    stock = models.IntegerField(default=0)

    def reduce_stock(self, number):
        if self.stock >= number:
            self.stock -= number

    class Meta:
        unique_together = ('product', 'size', 'color')

    def __str__(self):
        return self.product.title + "-" + self.size.title + "-" + self.color.title
