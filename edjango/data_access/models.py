from django.db import models


# Create your models here.
class Category(models.Model):
    title = models.CharField(max_length=255)

    def __str__(self):
        return self.title


class Brand(models.Model):
    title = models.CharField(max_length=255)

    def __str__(self):
        return self.title


class Color(models.Model):
    title = models.CharField(max_length=255)

    def __str__(self):
        return self.title


class Size(models.Model):
    title = models.CharField(max_length=255)

    def __str__(self):
        return self.title


class Product(models.Model):
    title = models.CharField(max_length=255)
    description = models.CharField(max_length=255)
    price = models.DecimalField(max_digits=10, decimal_places=2)
    category = models.ForeignKey(Category, on_delete=models.CASCADE)
    brand = models.ForeignKey(Brand, on_delete=models.CASCADE)
    image = models.CharField(max_length=255)  # image url for the product

    def __str__(self):
        return self.title

