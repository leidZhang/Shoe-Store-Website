from django_filters import rest_framework as filters


class ProductFilter(filters.FilterSet):
    title = filters.CharFilter(field_name='title', method='filter_title')
    brand = filters.CharFilter(field_name='brand__title', method='filter_brand')
    category = filters.CharFilter(field_name='category__title')

    def filter_brand(self, queryset, name, value):
        brands_to_filter = value.split(',')
        return queryset.filter(brand__title__in=brands_to_filter)

    def filter_title(self, queryset, name, value):
        brands_to_filter = value.split(',')
        return queryset.filter(title__in=brands_to_filter)
