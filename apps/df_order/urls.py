from django.urls import re_path
from . import views


urlpatterns = [
    re_path(r"^$", views.place_order),
    re_path(r'^order_handle$', views.order_handle),
]