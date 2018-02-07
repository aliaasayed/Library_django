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
from django.conf.urls.static import static
from django.conf import settings
import library.views as lib_views

urlpatterns = [
    path('', lib_views.index,name='index'),
    path('login.html/', lib_views.login_auth ,name='login'),
    path('signup.html/', lib_views.signup ,name='signup'),
    # path('user_home.html/', lib_views.index ,name='user_home'),
    # path('edit_user.html/', lib_views.edit_user ,name='edit_user'),
    path('category', lib_views.category,name="category"),
    path('search', lib_views.search,name="search"),
    path('book_info.html/<int:book_num>', lib_views.book_details),
    path('book', lib_views.book_status,name="book_status"),
    path('author_info.html/<int:author_num>', lib_views.author_details),
    path('user_info.html/<int:user_num>', lib_views.user_info),
    path('user_home.html', lib_views.user_home,name='user_home'),
    path('admin/', admin.site.urls),
]

urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
