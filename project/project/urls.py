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
   # path('login/', lib_views.login_auth ,name='login'),
    path('signup/', lib_views.signup ,name='signup'),
    path('logout/', lib_views.logout_auth ,name='logout'),
    path('edit_user/', lib_views.edit_user ,name='edit_user'),
    path('category', lib_views.category,name="category"),
    path('search', lib_views.search,name="search"),
    path('book_info/<int:book_num>', lib_views.book_details),
    path('book', lib_views.book_status,name="book_status"),
    path('followauthor', lib_views.follow_author,name="follow_author"),
    path('unfollowauthor', lib_views.unfollow_author,name="unfollow_author"),
    path('author_info/<int:author_num>', lib_views.author_details),
    path('user_info/<int:user_num>', lib_views.user_info,name='user_info'),
    path('user_home', lib_views.user_home,name='user_home'),
    path('fav_cat', lib_views.fav_cat,name="fav_cat"),
    path('unfav_cat', lib_views.unfav_cat,name="unfav_cat"),
    path('admin/', admin.site.urls),
    path('rating', lib_views.rating_book ,name='rating'),
]

urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
