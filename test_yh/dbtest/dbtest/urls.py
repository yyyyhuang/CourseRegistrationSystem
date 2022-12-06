"""dbtest URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.2/topics/http/urls/
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
from dbapp import views, advisorViews

urlpatterns = [
    # path('admin/', admin.site.urls),
    path('', views.homePage),
    path('student/<str:sid>', views.studentHome, name='student'),
    path('registerclass/<str:sid>', views.registerCourses),
    path('login', views.login),
    path('signup', views.signup),
    path('advisorHome/<str:adid>', advisorViews.advisorHome, name='advisorHome'),
    path('approveRequest/<str:adid>/<str:request_id>', advisorViews.approveRequest, name='approveRequest'),
    path('disapproveRequest/<str:adid>/<str:request_id>', advisorViews.disapproveRequest, name='disapproveRequest'),
    path('allStudents/<str:adid>', advisorViews.allStudents, name='allStudents'),
    path('viewDetails/<str:sid>', advisorViews.viewDetails, name='viewDetails'),
    path('sendMsg/<str:adid>/<str:sid>', advisorViews.sendMsg, name='sendMsg'),
    path('replyMsg/<str:adid>/<str:sid>/<str:ntid>', advisorViews.replyMsg, name='replyMsg'),
    path('viewMessages/<str:adid>', advisorViews.viewMessages, name='viewMessages'),
    path('advisorProfile/<str:adid>', advisorViews.advisorProfile, name='advisorProfile'),
]