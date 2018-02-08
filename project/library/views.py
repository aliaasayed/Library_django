from django.shortcuts import render,redirect
from django.http import HttpResponse , HttpResponseRedirect
from django.contrib.auth import authenticate , login , logout
from django.contrib.auth.models import User
from library.models import *
from .forms import *
from django import forms
# Create your views here.
def index(request):
    categories=Category.objects.all()
    return render(request,"index.html",{'categories':categories})

def signup(request):
    if request.method=='POST':
        form = AddUser(request.POST)
        if form.is_valid():
            user_form = form.save(commit=False)
            password = form.cleaned_data['password']
            user_form.set_password(user_form.password)
            user_form.save()
            return redirect("login")
    else:
        form = AddUser()
        return render(request,"signup.html/",{"form":form})

def login_auth(request):
    if request.method=='POST':
        form = Login_form(request.POST)
        username=request.POST['username']
        password=request.POST['password']
        user=authenticate(username=username,password=password)
        if user is not None:
            login(request,user)
            return redirect("user_home")
    else:
        form = Login_form()
        return render(request,"login.html/",{"form":form})

def logout_auth(request):
    if request.user.is_authenticated:
        logout(request)
        return redirect("login")

def edit_user(request):
    if request.method=='GET':
        if request.user.is_authenticated:
            form = Edit_form(initial={'first_name':request.user.first_name,'last_name':request.user.last_name,'email':request.user.email,'username':request.user.username})
            return render(request,"edit_user.html/",{"form":form})
    else:
        if request.user.is_authenticated:
            form=Edit_form()
            if form.is_valid():
                edit_form = form.save(commit=False)
                first_name = form.cleaned_data.get('first_name')
                last_name = form.cleaned_data['last_name']
                username = form.cleaned_data['username']
                email = form.cleaned_data['email']
                password = form.cleaned_data['password']
                hash_password=edit_form.set_password(edit_form.password)
                User.objects.fillter(id=request.user.id).update(first_name=first_name,last_name=last_name,email=email,password=hash_password)
                edit_form.save()
                return redirect("user_home")
        # else:
    #     form = Edit_form()
    #     return render(request,"edit_user.html/",{"form":form})

def search(request):
    categories=Category.objects.all()
    query=request.POST['Query']
    books=Book.objects.filter(name__icontains=query)
    authors=Author.objects.filter(name__icontains=query)
    return render(request,"search_result.html",{'query':query,'books':books,'authors':authors,'categories':categories})

def category(request):
    query=request.POST['Query']
    category=Category.objects.get(cat_name=query)
    cat_books=category.book.all()
    categories=Category.objects.all()
    #author=Author.objects.filter(author_id__in=category.book.all())
    return render(request,"category.html",{'categories':categories,'cat_books':cat_books})



def book_details(request,book_num):
    book=Book.objects.filter(book_id=book_num)
    ur=user_book._meta.get_field('status').choices
    bookid=book_num
    return render(request,"book_info.html",{'book':book,'ur':ur,'bookid':bookid})



def author_details(request,author_num):
    author=Author.objects.filter(author_id=author_num)
    author_books=Book.objects.filter(author_id=author_num)
    authorid=author_num
    return render(request,"author_info.html",{'author':author,'author_books':author_books,'authorid':authorid})


def user_info(request,user_num):
    user=User.objects.filter(id=user_num)
    return render(request,"user_info.html",{'user':user})



def user_home(request):
    user_num=request.user.id
    #user=User.objects.get(id=user_num)
    fav=Category.objects.filter(favourite__id=user_num)
    read_books=user_book.objects.filter(user_id=user_num).filter(status='read').values()
    books=Book.objects.all()
    whish_books=user_book.objects.filter(user_id=user_num).filter(status='wish').values()
    follow=Author.objects.filter(follow__id=user_num).values()
    return render(request,"user_home.html",{'fav':fav,'read_books':read_books,'whish_books':whish_books,'follow':follow,'books':books})


def book_status(request):
    bkstatus=request.POST['status']
    usr=request.user.id
    bkd=request.POST['book_id']
    book=Book.objects.get(book_id=bkd)
    user=User.objects.get(id=usr)
    if(user_book.objects.filter(user_id=usr).filter(book_id=bkd)):
        user_book.objects.filter(user_id=usr).filter(book_id=bkd).update(status=bkstatus)
    else:
        user_book.objects.create(user_id=user,book_id=book,status=bkstatus)
    return  book_details(request,bkd) #user_home(request)


def follow_author(request):
    usr=request.user.id
    user=User.objects.get(id=usr)
    authorid=request.POST['authid']
    author=Author.objects.get(author_id=authorid)
    author.follow.add(user)
    return  user_home(request)



def unfollow_author(request):
    usr=request.user.id
    user=User.objects.get(id=usr)
    authorid=request.POST['authid']
    author=Author.objects.get(author_id=authorid)
    author.follow.remove(user)
    return  user_home(request)
