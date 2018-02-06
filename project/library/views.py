from django.shortcuts import render,redirect
from django.http import HttpResponse
from django.http import HttpResponseRedirect
from .models import Category,Author,Book
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

