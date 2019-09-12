from django.db import models


class CartInfo(models.Model):
    """购物车模型类：用户，商品，数量"""
    user = models.ForeignKey('df_user.UserInfo', on_delete=models.CASCADE)
    goods = models.ForeignKey('df_goods.GoodsInfo', on_delete=models.CASCADE)
    count = models.IntegerField()
