from django.shortcuts import render

# Create your views here.
from rest_framework.views import APIView
from rest_framework.response import Response
from .models import Comment
from .serializers import CommentSerializer

class PostCommentView(APIView):
    def post(self, request,*args,**kwargs):
        if request.user.is_authenticated:
            ser = CommentSerializer(data=request.data)
            if ser.is_valid():
                userHandle = request.user.username
                userName = request.user.first_name + " " + request.user.last_name
                text = ser.data["text"]
                tweet_id = ser.data["tweet_id"]
                newComment = Comment.objects.create(userHandle=userHandle,userName=userName,likes=0,text=text,tweet_id=tweet_id)
                ser = CommentSerializer(newComment)
                return Response({"msg":"success","comment":ser.data})
            else: return Response({"msg":"failure","hint":ser.errors})
        else: return Response({"msg":"failure","hint":"unauthorized"})

    def get(self,request,*args,**kwargs):
        if request.user.is_authenticated:
            tweet_id = request.query_params["tweet_id"]
            comments = Comment.objects.filter(tweet_id=tweet_id)
            ser = CommentSerializer(comments,many=True)
            return Response({"msg":"success","comments":ser.data})
        else: return Response({"msg":"failure","hint":"unauthorized"})