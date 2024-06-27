from django.contrib import admin
from quora.models import post,category,CustomUser, comment, spaces, Message
# Register your models here.
admin.site.register(post)
admin.site.register(category)
admin.site.register(CustomUser)
admin.site.register(comment)
admin.site.register(spaces)
admin.site.register(Message)



