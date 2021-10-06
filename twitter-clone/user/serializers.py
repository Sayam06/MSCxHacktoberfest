from rest_framework import serializers

from django.contrib.auth.models import User

class UserSignUpSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ("id","first_name","last_name","email","username","password")

class UserLoginSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ("username","password")