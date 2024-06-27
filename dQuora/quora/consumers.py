import json
from quora.models import CustomUser
from channels.generic.websocket import AsyncWebsocketConsumer
from asgiref.sync import sync_to_async

from .models import spaces,Message

class ChatConsumer(AsyncWebsocketConsumer):
    async def connect(self):
        self.room_name = self.scope['url_route']['kwargs']['room_name']
        self.room_group_name = 'chat_%s' % self.room_name
        print('connected!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!')

        await self.channel_layer.group_add(
            self.room_group_name,
            self.channel_name
        )

        await self.accept()
    
    async def disconnect(self):
        await self.channel_layer.group_discard(
            self.room_group_name,
            self.channel_name
        )

    # Receive message from WebSocket
    async def receive(self, text_data):
        print(text_data)
        data = json.loads(text_data)
        print('data',data)
        message = data['message']
        username = data['username']
        room = data['room']
        try:
            image = data['image']
            await self.save_message(username, room, message, image)
            await self.channel_layer.group_send(
                self.room_group_name,
                {
                    'type': 'chat_message',
                    'message': message,
                    'username': username,
                    'room' : room,
                    'image':image
                }
            )
        except:
            await self.save_message(username, room, message)

            # Send message to room group
            await self.channel_layer.group_send(
                self.room_group_name,
                {
                    'type': 'chat_message',
                    'message': message,
                    'username': username,
                    'room' : room,
                    'image':'',
                }
            )

    # Receive message from room group
    async def chat_message(self, event):
        message = event['message']
        username = event['username']
        room = event['room']
        try:
            if event['image']:
                image = event['image']

            # Send message to WebSocket
            await self.send(text_data=json.dumps({
                'message': message,
                'username': username,
                'room':room,
                'image':image,
            }))
        except:
            await self.send(text_data=json.dumps({
                'message': message,
                'username': username,
                'room':room,
            }))

    @sync_to_async
    def save_message(self,username,room,message,image=''):
        user = CustomUser.objects.get(username=username)
        room = spaces.objects.get(name=room)
        if image == '':
            Message.objects.create(user_name=user, room_id=room, message=message)
        else:
            print(image)
            Message.objects.create(user_name=user, room_id=room, message=message,image=image)





