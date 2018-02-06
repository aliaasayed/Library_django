from django.shortcuts import render,redirect
from django.http import HttpResponse
from django.http import HttpResponseRedirect
from library.models import *
from django.contrib.auth.models import User
# Create your views here.
def index(request):
    categories=Category.objects.all()
    return render(request,"index.html",{'categories':categories})


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
    return render(request,"book_info.html",{'book':book})


def author_details(request,author_num):
    author=Author.objects.filter(author_id=author_num)
    return render(request,"author_info.html",{'author':author})


def user_info(request,user_num):
    user=User.objects.filter(id=user_num)
    return render(request,"user_info.html",{'user':user})



def user_home(request,user_num):
    #user=User.objects.get(id=user_num)
    fav=Category.objects.filter(favourite__id=user_num)
    read_books=user_book.objects.filter(user_id=user_num).filter(status='read').values()
    books=Book.objects.all()
    whish_books=user_book.objects.filter(user_id=user_num).filter(status='wish').values()
    follow=Author.objects.filter(follow__id=user_num).values()
    return render(request,"user_home.html",{'fav':fav,'read_books':read_books,'whish_books':whish_books,'follow':follow,'books':books})

