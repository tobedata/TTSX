from django.urls import re_path
from . import views


urlpatterns = [
    re_path(r"^list_(?P<tid>\d+)_(?P<sort>[0-2])_(?P<pindex>\d+)/$", views.goods_list),
    re_path(r"(?P<gid>\d+)/$", views.goods_detail),
]