from django.apps import AppConfig
from django.conf import settings

class QuoraConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'quora'
    def ready(self):
        from django.contrib.auth.models import Group
        from django.db.models.signals import post_save
        def add_to_user_group(sender,instance,created,**kwargs):
            user = instance
            print("----------------user",user)
            if created:
                group, ok = Group.objects.get_or_create(name='user_rights')
                group.user_set.add(user)
        post_save.connect(add_to_user_group,sender=settings.AUTH_USER_MODEL)

