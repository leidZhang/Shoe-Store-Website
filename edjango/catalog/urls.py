from django.urls import path
from .import views

urlpatterns = [
    path('inventory', views.InventoryView.as_view()),
    path('inventory/<int:product_id>', views.InventoryByProductIDView.as_view())
]
