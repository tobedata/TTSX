from django.urls import re_path
from . import views

urlpatterns = [
    re_path(r"^$", views.cart),
    re_path(r"^add_(?P<gid>\d+)_(?P<num>\d+)/$", views.add),
    re_path(r"^remove/$", views.remove),
    re_path(r"^edit_(?P<cid>\d+)_(?P<num>\d+)/$", views.edit),
]
