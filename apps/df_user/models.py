from django.db import models


class UserInfo(models.Model):
    """用户模型类"""
    uname = models.CharField(max_length=32)
    upwd = models.CharField(max_length=40)
    uemail = models.CharField(max_length=32)
    uphone = models.CharField(max_length=11, default='')
    recv_name = models.CharField(max_length=32, default='')
    recv_addr = models.CharField(max_length=100, default='')
    recv_code = models.CharField(max_length=6, default='')
    is_delete = models.BooleanField(default=False)
