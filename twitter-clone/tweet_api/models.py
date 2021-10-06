from django.db import models

# Create your models here.
class Tweet(models.Model):
    text = models.TextField(null=False,blank=False)
    likes = models.IntegerField(default=0)
    userName = models.CharField(max_length=50,default="Admin",blank=False,null=False)
    userHandle = models.CharField(max_length=50,default="adminOP",blank=False,null=False)

    def __str__(self):
        return self.text + "by: "+self.userName+"("+self.userHandle+")"