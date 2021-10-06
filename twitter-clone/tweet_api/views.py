from django.shortcuts import render
from django.http import HttpResponse

from rest_framework.views import APIView
from rest_framework.response import Response

from .models import Tweet
from .serializers import TweetSerializer , LikeSerializer

class TweetView(APIView):
    def get(self, request,*args,**kwargs):
        if request.user.is_authenticated:
            qs = Tweet.objects.all()
            data = TweetSerializer(qs,many=True)
            return Response({"msg":"success","tweets":data.data})
        else:
            return Response({"msg":"failure"})

    def post(self,request,*args,**kwargs):
        if request.user.is_authenticated:
            ser = TweetSerializer(data=request.data)
            if ser.is_valid():
                text = ser.data["text"]
                likes = 0
                userHandle = request.user.username
                userName = request.user.first_name + " " + request.user.last_name
                newTweet = Tweet.objects.create(text = text,likes=likes,userName=userName,userHandle=userHandle)
                ser = TweetSerializer(newTweet)
                return Response({"msg":"success","tweet":ser.data})
            
            return Response({"msg":"Invalid tweet"})

            # serializer = TweetSerializer(data=request.data)
            # if serializer.is_valid():
            #     #serializer.save()
            #     print(request.user.id)
            #     return Response(serializer.data)
        return Response({"msg":"unauthenticated"})

class LikeTweet(APIView):
    def post(self,request,*args,**kwargs):
        #  if request.user.is_authenticated:
        idTweet = request.data["id"]
        tweet = Tweet.objects.get(id=idTweet)
        if tweet is not None:
            tweet.likes += 1
            tweet.save()
            ser = TweetSerializer(tweet)
            return Response({"msg":"success","tweet":ser.data})
        return Response({"msg":"sfailure"})
