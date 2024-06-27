from django.urls import path
from quora.consumers import ChatConsumer

websocket_urlpatterns = [
    path("" , ChatConsumer.as_asgi()) , 
]