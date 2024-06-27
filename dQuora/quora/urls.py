
from django.contrib import admin
from django.urls import path
from quora import views
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path("",views.index),
    path("signup",views.signup),
    path("post_page/<int:post_id>",views.post_page),
    path('fetch_post',views.fetch_posts),
    path('create_query',views.create_query),
    path('comment/<int:post_id>',views.comment_made),
    path('profile/<int:user_id>',views.profile),
    path('delete_post/<int:post_id>',views.delete_post),
    path('modify_post/<int:post_id>',views.modify_post),
    path('spaces',views.all_spaces),
    path('space_room/<int:room_id>',views.ChatRoom),
    path('upload_image',views.upload_image)


]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)