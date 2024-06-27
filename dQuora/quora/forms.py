from django import forms
from django.contrib.auth.forms import UserCreationForm
from quora.models import User,post,category,CustomUser,comment
from django.contrib.auth.models import User
# from sugar.models import Menu,orders,User_def,review

class RegistrationForm(UserCreationForm):
    class Meta:
        model = CustomUser
        fields = ["avatar", "email", "username", "password1", "password2","bio"]


class postForm(forms.ModelForm):
    
    class Meta:
        model = post
        fields = ("user_name","categories","query","image","content")

class commentForm(forms.ModelForm):
    class Meta:
        model = comment
        fields = ("Post","content","image")
