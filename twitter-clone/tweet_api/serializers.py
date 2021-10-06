from rest_framework import serializers

from .models import Tweet

class TweetSerializer(serializers.ModelSerializer):
    class Meta:
        model = Tweet
        fields = ("id","text","likes","userName","userHandle")

class LikeSerializer(serializers.ModelSerializer):
    class Meta:
        model = Tweet
        fields = ("id","userHandle")