from django.shortcuts import render
from django.contrib.auth.models import User, auth
from rest_framework.views import APIView
from rest_framework.response import Response

from .serializers import UserSignUpSerializer , UserLoginSerializer

# Create your views here.
class TwitterUserSignUp(APIView):
    def get(self,request,*args,**kwargs):
        # print(request.user.is_active())
        qs = User.objects.all()
        ser = UserSignUpSerializer(qs,many=True)
        return Response(ser.data)
    
    def post(self,request,*args,**kwargs):
        ser = UserSignUpSerializer(data=request.data)
        if ser.is_valid():
            #print(ser.data)
            user = User.objects.create_user(username=ser.data["username"],password=ser.data["password"],email=ser.data["email"],first_name=ser.data["first_name"],last_name=ser.data["last_name"])
            user.save()
            auth.login(request,user)
            return Response({"msg":"success","redirect":"profile"})
        else:
            return Response({"msg":"err","hint":ser.data})

class TwitterUserLogin(APIView):
    def post(self,request,*args,**kwargs):
        ser = UserLoginSerializer(data=request.data)
        ser.is_valid()
        username = ser.data["username"]
        pwd = ser.data["password"]
        user = auth.authenticate(username=username,password=pwd)
        print(username, pwd)
        if user is not None:
            auth.login(request,user)
            return Response({"msg":"success","redirect":"profile"})
        else:
            return Response({"msg":"err","redirect":"none"})

class TwitterUserLogout(APIView):
    def get(self,request,*args,**kwargs):
        auth.logout(request)
        return Response({"msg":"success"})