from django import forms
from django.contrib.auth.models import User
class AddUser(forms.ModelForm):
    class Meta:
        model = User
        fields = ['first_name', 'last_name', 'username', 'email','password']
    first_name = forms.CharField(label='First Name', max_length=50)
    last_name = forms.CharField(label='Last Name', max_length=50)
    username = forms.CharField(label='UserName', max_length=50)
    email = forms.EmailField(label='Email', max_length=100)
    password = forms.CharField(label='Password',widget=forms.PasswordInput)

class Login_form(forms.ModelForm):
    class Meta:
        model = User
        fields = ['username','password']
    username = forms.CharField(label='UserName', max_length=100)
    password = forms.CharField(label='Password',widget=forms.PasswordInput)

class Edit_form(forms.ModelForm):
    class Meta:
        model = User
        fields = ['first_name', 'last_name', 'username', 'email']
    first_name = forms.CharField(label='First Name', max_length=50)
    last_name = forms.CharField(label='Last Name', max_length=50)
    username = forms.CharField(label='user Name', max_length=50)
    email = forms.EmailField(label='Email', max_length=100)
    # password = forms.CharField(label='Password',widget=forms.PasswordInput)
