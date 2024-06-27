from django.db import models
from django.utils.translation import gettext as _
from django.contrib.auth.models import AbstractUser,User
from django.conf import settings 

# Create your models here.
class CustomUser(AbstractUser):
    # Add custom fields here
    avatar = models.CharField(max_length=50,null=True)
    bio = models.CharField(max_length=200,null=True)
    joined = models.DateTimeField(auto_now=True)
class category(models.Model):
    name=models.CharField(max_length=30,null=True)
    image=models.ImageField(upload_to='static/category/')
    def __str__(self):
        return self.name

class post(models.Model):
    user_name=models.ForeignKey(settings.AUTH_USER_MODEL, null=True, on_delete=models.CASCADE)
    categories = models.ForeignKey(category, null=False, default=1,blank=True, on_delete=models.CASCADE)
    image = models.ImageField(upload_to='static/', null=True, blank=True, default=None)
    time=models.DateTimeField(auto_now=True)
    query=models.CharField(max_length=100,null=True)
    content=models.TextField(max_length=1500,null=True,blank=True)

class comment(models.Model):
    user_name=models.ForeignKey(settings.AUTH_USER_MODEL, null=True, on_delete=models.CASCADE)
    Post=models.ForeignKey(post, null=True, on_delete=models.CASCADE)
    content=models.TextField(max_length=1000,null=False)
    image=models.ImageField(upload_to='static/comments/', null=True, blank=True, default=None)
    date=models.DateField(auto_now=True)

class spaces(models.Model):
    name = models.CharField(max_length=50)
    image = models.ImageField(upload_to='static/spaces/',null=True, blank=False, default="/static/spaces/deafult_space.png")
    description = models.CharField(max_length=200)


class Message(models.Model):
    user_name = models.ForeignKey(settings.AUTH_USER_MODEL,null=True, on_delete=models.CASCADE)
    room_id = models.ForeignKey(spaces,null=True, on_delete=models.CASCADE)
    message = models.CharField(max_length=300)
    image=models.ImageField(upload_to='static/messages/',null=True,blank=True)
    post_time = models.TimeField(auto_now=True)

    