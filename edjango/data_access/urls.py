from .import views
from django.urls import path

urlpatterns = [
    path('categories', views.CategoryView.as_view()),
    path('brands', views.BrandView.as_view()),
    path('products', views.ProductView.as_view()),
    path('products/all', views.GeneralProductView.as_view()),
    path('products/<int:pk>', views.SingleProductView.as_view())
]
