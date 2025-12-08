from rest_framework import serializers

from .models import Customer, CustomerInfo


class CustomerSerializer(serializers.ModelSerializer):
    class Meta:
        model = Customer
        fields = ['id', 'first_name', 'last_name']


class CustomerInfoSerializer(serializers.ModelSerializer):
    customer = CustomerSerializer(many=False)

    class Meta:
        model = CustomerInfo
        fields = ['phone_num', 'address_1', 'address_2', 'city', 'province', 'postal_code', 'customer']

    def update(self, instance, validated_data):
        # get the OrderedDict
        customer_data = validated_data.pop("customer")
        # update or create a Customer instance
        customer_serializer = CustomerSerializer(instance.customer, data=customer_data)
        if customer_serializer.is_valid():
            customer = customer_serializer.save()
            instance.customer = customer  # assign the Customer instance to CustomerInfo.customer field

        # update other fields as needed
        instance.phone_num = validated_data.pop("phone_num")
        instance.city = validated_data.pop("city")
        instance.address_1 = validated_data.pop("address_1")
        instance.address_2 = validated_data.get("address_2") or ""
        instance.province = validated_data.pop("province")
        instance.postal_code = validated_data.pop("postal_code")

        instance.save()
        return instance

