from django.urls import re_path
from . import views


urlpatterns = [
    re_path(r"^center_info/$", views.user_center_info),
    re_path(r"^register_handle/$", views.register_handle),
    re_path(r"^register_exist/$", views.register_exist),
    re_path(r"^login_handle/$", views.login_handle),
    re_path(r"^center_site/$", views.user_center_site),
]
