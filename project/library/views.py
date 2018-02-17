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
        # return render(request,"login.html/",{"form":form})
        return render(request,"index.html",{'categories':categories,"form":form})

def signup(request):
    if request.method=='POST':
        form = AddUser(request.POST,request.FILES)
        profile=user_profile()
        if form.is_valid():
            user_form = form.save(commit=False)
            password = form.cleaned_data['password']
            user_form.set_password(user_form.password)
            user_form.save()
            profile.user=user_form
            profile.img=form.cleaned_data['img']
            profile.save()
            return redirect("index")
        else:
            form = AddUser()
            return render(request,"signup.html/",{'categories':categories,"form":form})
    else:
        categories=Category.objects.all()
        form = AddUser()
        return render(request,"signup.html/",{'categories':categories,"form":form})

# def login_auth(request):
#     if request.method=='POST':
#         form = Login_form(request.POST)
#         username=request.POST['username']
#         password=request.POST['password']
#         user=authenticate(username=username,password=password)
#         if user is not None:
#             login(request,user)
#             return redirect("user_home")
#     else:
#         form = Login_form()
#         return render(request,"login.html/",{"form":form})

def logout_auth(request):
    if request.user.is_authenticated:
        logout(request)
        return redirect("index")

def edit_user(request):
    if request.method=='GET':
        if request.user.is_authenticated:
            form = Edit_form(initial={'first_name':request.user.first_name,'last_name':request.user.last_name,'email':request.user.email,'username':request.user.username})
            return render(request,"edit_user.html/",{"form":form})
    else:
        if request.user.is_authenticated:
            form=Edit_form(request.POST)
            if form.is_valid():
                # edit_form = form.save(commit=False)
                first_name = form.cleaned_data.get('first_name')
                last_name = form.cleaned_data.get('last_name')
                username = form.cleaned_data.get('username')
                email = form.cleaned_data.get('email')
                # password = form.cleaned_data.get('password')
                # hash_password=form.set_password(form.password)
                id=request.user.id
                User.objects.filter(id=id).update(first_name=first_name,last_name=last_name,email=email,username=username)
                # edit_form.save()
                return redirect("user_info",id)
            else:
                id=request.user.id
                return redirect("user_info",id)

        else:
            form = Edit_form()
            return render(request,"edit_user.html/",{"form":form})

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
    catid=category.cat_id
    return render(request,"category.html",{'catid':catid,'categories':categories,'cat_books':cat_books})




def book_details(request,book_num):
    book=Book.objects.filter(book_id=book_num)
    ur=user_book._meta.get_field('status').choices
    bookid=book_num
    book_rating=" "
    categories=Category.objects.all()
    if(user_book.objects.filter(user_id=request.user.id).filter(book_id=book_num)):
        book_rated=user_book.objects.get(user_id=request.user.id,book_id=book_num)
        book_rating=book_rated.rate
    return render(request,"book_info.html",{'book_rating':book_rating,'book':book,'ur':ur,'bookid':bookid,'categories':categories})



def author_details(request,author_num):
    author=Author.objects.filter(author_id=author_num)
    author_books=Book.objects.filter(author_id=author_num)
    authorid=author_num
    categories=Category.objects.all()
    return render(request,"author_info.html",{'categories':categories,'author':author,'author_books':author_books,'authorid':authorid})


def user_info(request,user_num):
    user=User.objects.filter(id=user_num)
    categories=Category.objects.all()
    return render(request,"user_info.html",{'categories':categories,'user':user})



def user_home(request):
    categories=Category.objects.all()
    user_num=request.user.id
    #user=User.objects.get(id=user_num)
    fav=Category.objects.filter(favourite__id=user_num)
    read_books=user_book.objects.filter(user_id=user_num).filter(status='read').values()
    books=Book.objects.all()
    whish_books=user_book.objects.filter(user_id=user_num).filter(status='wish').values()
    follow=Author.objects.filter(follow__id=user_num).values()

    return render(request,"user_home.html",{'categories':categories,'fav':fav,'read_books':read_books,'whish_books':whish_books,'follow':follow,'books':books})



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
    return  book_details(request,bkd) 


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

def rating_book(request):
    book_id=request.POST['id']
    rating=request.POST['rate']
    book=Book.objects.get(book_id=book_id)
    user=User.objects.get(id=request.user.id)
    if(user_book.objects.filter(user_id=request.user.id).filter(book_id=book_id)):
        user_book.objects.filter(user_id=request.user.id).filter(book_id=book_id).update(rate=rating)
    else:
        user_book.objects.create(user_id=user,book_id=book,rate=rating)
    # book=user_book.objects.get(book_id=book_id,user_id=request.user.id)
    # book.rate=rating
    # book.save()
   
    return book_details(request,book_id)


def fav_cat(request):
    usr=request.user.id
    user=User.objects.get(id=usr)
    catid=request.POST['catid']
    category=Category.objects.get(cat_id=catid)
    category.favourite.add(user)
    return  user_home(request)

def unfav_cat(request):
    usr=request.user.id
    user=User.objects.get(id=usr)
    catid=request.POST['catid']
    category=Category.objects.get(cat_id=catid)
    category.favourite.remove(user)
    return  user_home(request)
