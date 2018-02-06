from django.shortcuts import render,redirect
from django.http import HttpResponse
from django.http import HttpResponseRedirect
from library.models import *
from django.contrib.auth.models import User
# Create your views here.
def search_result(request,search_word):
    books=Book.objects.filter(name=search_word)
    authors=Author.objects.filter(name=search_word)
    return render(request,"search_result.html",{'books':books,'authors':authors})

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
