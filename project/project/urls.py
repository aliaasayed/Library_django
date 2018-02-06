"""project URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
import library.views as lib_views

urlpatterns = [
    #path('', lib_views.index),
    path('search_result.html/<search_word>', lib_views.search_result),
    path('book_info.html/<int:book_num>', lib_views.book_details),
    path('author_info.html/<int:author_num>', lib_views.author_details),
    path('user_info.html/<int:user_num>', lib_views.user_info),
    path('user_home.html/<int:user_num>', lib_views.user_home),
    path('admin/', admin.site.urls),
]
