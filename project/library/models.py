from django.db import models
from django.contrib.auth.models import User

#from static import author_img , book_img
# Create your models here.
class user_profile(models.Model):
    user = models.OneToOneField(User,on_delete=models.CASCADE)
    img = models.ImageField(upload_to = 'user_img/', default = 'author_img/None/no-img.jpg')

class Author(models.Model):
    author_id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=50)
    date_of_birth = models.DateField()
    date_of_die = models.DateField()
    contact = models.CharField(max_length=100)
    bio = models.TextField()
    follow = models.ManyToManyField(User)
    img = models.ImageField(upload_to = 'author_img/', default = 'author_img/None/no-img.jpg')
    def __str__(self):
        return self.name

class Book(models.Model):
    book_id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=50)
    author_id = models.ForeignKey('Author',on_delete=models.CASCADE)
    published_at = models.DateField()
    summary = models.TextField()
    country = models.CharField(max_length=50)
    link = models.URLField(max_length=200)
    user_id = models.ManyToManyField(User,through="user_book")
    img = models.ImageField(upload_to = 'book_img/', default = 'book_img/None/no-img.jpg')
    def __str__(self):
        return self.name

class Category(models.Model):
    cat_id = models.AutoField(primary_key=True)
    cat_name = models.CharField(max_length=50)
    book = models.ManyToManyField(Book)
    favourite = models.ManyToManyField(User)
    def __str__(self):
        return self.cat_name

class user_book(models.Model):
    book_id = models.ForeignKey(Book,on_delete=models.CASCADE)
    user_id = models.ForeignKey(User,on_delete=models.CASCADE)
    rate = models.IntegerField(null=True)
    status = models.CharField(choices=(('0', 'read'),('1','wish')),max_length=10,null=True)
