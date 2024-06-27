from django.shortcuts import render,redirect
from quora.forms import RegistrationForm, postForm, commentForm
from quora.models import User,post,category,comment,spaces,Message,CustomUser
from django.http import JsonResponse
from django.utils.dateformat import DateFormat
from django.contrib.auth.decorators import login_required,permission_required
from django.contrib.auth.models import User, Group, Permission
from django.urls import reverse,reverse_lazy
from django.views.decorators.csrf import csrf_exempt
from django.core.files.storage import default_storage
from django.core.files.base import ContentFile
import os
# Create your views here.


def is_anonymous(request):
    print(request.user.is_anonymous)
    return request.user.is_anonymous

# def rights(user_id):
#     user_rights,created=Group.objects.get_or_create(name="user_rights")
#     print(created)
#     group = Group.objects.get(name=user_rights)
#     members = group.user_set.all()
#     print(members)
#     ct=ContentType.objects.get_for_model(model=post)
#     perms=Permission.objects.filter(content_type=ct)
#     user_rights.permissions.add(*perms) #for all permissions in perms
#     user_rights.user_set.add(user_id)

def signup(request):
    if request.method=="POST":
        form = RegistrationForm(request.POST)
        for i in form:
            print(i)
        if form.is_valid():
            try:
                a=form.save()
                context={'form':form,'success':'SuccessFully Created!!'}
                # print(a.id)
                # rights(a.id)
                return render(request,'signup.html',context)
            except:
                print('failed to create an account!!')
                context={'success':'Failed to create'}
                return render(request,'signup.html',context)
    else:
        return render(request,'signup.html') 
    context={'form':form}    
        # print(context['pass_mismatch'])
    return render(request,'signup.html',context)

def index(request):
    user_id=request.user.id
    global available_posts
    available_posts = post.objects.all().order_by('?')
    a  =available_posts
    print(a)
    cat = category.objects.all()
    content={
        'posts':available_posts,
        'categories':cat}
    return render(request,'home.html',content)

def post_page(request,post_id):
    req_post = post.objects.get(id=post_id)
    comments = comment.objects.filter(Post=post_id).order_by('-id')
    content = { 'post':req_post, 'comments':comments}
    return render(request,'post_page.html',content)
    
fetched = []
def fetch_posts(request):
    offset=int(request.GET.get('offset',0))
    print('offset-------->',offset)
    limit=3
    posts = post.objects.all().order_by('-id')[offset:offset+limit]
    
    fetched_post=[{
        'id':post.id,
        'avatar':post.user_name.avatar,
        'username':post.user_name.username,
        'query':post.query,
        'image':post.image.url if post.image else None,
        'content':post.content,
        'time':DateFormat(post.time).format('d M Y')
    }for post in posts]
    return JsonResponse({'posts':fetched_post})

@login_required(login_url=reverse_lazy('login'))
def create_query(request):
    if not is_anonymous(request):
        user_id=request.user.id
        posts = post.objects.exclude(user_name=user_id)
        cat = category.objects.all()
        content={
            'posts':posts,
            'categories':cat}
        if request.method == "POST":
            form = postForm(request.POST,request.FILES)
            for i in form:
                print(i)
            print(form.errors)

            if form.is_valid():
                try:
                    form.save()
                except:
                    print('some error occured!!')
            else:
                print('Unable to create!!')
        return redirect('/')

@login_required(login_url=reverse_lazy('login'))
def comment_made(request, post_id):
    if request.method == "POST":
        form = commentForm(request.POST, request.FILES)
        if form.is_valid():
            try:
                commented = form.save(commit=False)
                commented.user_name = request.user 
                commented.save()
                recent_comment = comment.objects.filter(Post=post_id).order_by('-id').first()
                new_comment = {
                    'avatar': recent_comment.user_name.avatar,
                    'username': recent_comment.user_name.username,
                    'content': recent_comment.content,                 # Content of the comment
                    'image': recent_comment.image.url if recent_comment.image else None  # URL of the image if it exists
                }
                return JsonResponse({'message': 'Successful','new_comment':new_comment}, status=200)
            except Exception as e:
                print(f'Unable to save: {e}')
                return JsonResponse({'message': 'Unable to save the comment'}, status=500)
        else:
            return JsonResponse({'message': 'Invalid form data', 'errors': form.errors}, status=400)
    else:
        return JsonResponse({'message': 'Method not allowed'}, status=405)

@login_required(login_url=reverse_lazy('login'))
def profile(request,user_id):
    requested_id=CustomUser.objects.get(id=user_id)
    posts=post.objects.filter(user_name=user_id)
    space = spaces.objects.get(id=1)
    content = {
        'room' : space,
        'requested_id':user_id,
        'posts':posts
    }
    return render(request,"profile.html",content)

def delete_post(request,post_id):
    try:
        Post=post.objects.filter(id=post_id)
        # Post.delete()
        return JsonResponse({'message': 'Message was Successfully deleted!','deleted':'true'})
    except Post.DoesNotExist:
        return JsonResponse({'message': 'Some error occured. Try later!!','deleted':''})

@permission_required('quora.change_post',login_url=reverse_lazy('login'))
def modify_post(request,post_id):
    print("REACHED TO PYTHON")
    if request.method == 'POST' :
        Post = post.objects.get(id=post_id)
        Post.query = request.POST.get('query')
        Post.content = request.POST.get('content')
        Post.save()
        return JsonResponse({'message': 'Post modified successfully'})
    else:
        return JsonResponse({'message': 'Some error occured!!!'})

def all_spaces(request):
    space = spaces.objects.all()
    print(space)
    content = {
        'rooms' : space
    }
    return render(request,'spaces.html',content)

@login_required(login_url=reverse_lazy('login'))
def ChatRoom(request,room_id):
    space = spaces.objects.get(id=room_id)
    all_spaces = spaces.objects.all()
    messages = Message.objects.filter(room_id=room_id).order_by('-id')
    content = {
        'spaces':all_spaces,
        'room' : space,
        'messages':messages
    }
    return render(request,'room.html',content)

def upload_image(request):
    if request.method == 'POST' and request.FILES.get('image'):
        image = request.FILES['image']
        subfolder = 'uploads'  # Subfolder within the media directory
        subfolder_path = os.path.join('media', subfolder)
        if not os.path.exists(subfolder_path):
            os.makedirs(subfolder_path)
        file_path = default_storage.save(os.path.join(subfolder, image.name), ContentFile(image.read()))
        image_url = default_storage.url(file_path)
        return JsonResponse({'image_url': image_url})
    return JsonResponse({'error': 'Invalid request'}, status=400)