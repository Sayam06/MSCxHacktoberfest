from rest_framework import serializers

from .models import Comment

class CommentSerializer(serializers.ModelSerializer):
    class Meta:
        model = Comment
        fields = ("id","text","likes","userName","userHandle","tweet_id")

# class LikeSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = Tweet
#         fields = ("id","userHandle")