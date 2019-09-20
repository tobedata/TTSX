from django.db import models


class OrderInfo(models.Model):
    """订单信息"""
    oid = models.CharField(max_length=20, primary_key=True)
    user = models.ForeignKey('df_user.UserInfo', on_delete=models.CASCADE)
    odate = models.DateTimeField(auto_now=True)
    oIsPay = models.BooleanField(default=False)
    # 总价ototal保存为字段，减轻每次数据库聚合查询压力
    ototal = models.DecimalField(max_digits=6, decimal_places=2)
    oaddress = models.CharField(max_length=150)


class OrderDetail(models.Model):
    """订单详情"""
    goods = models.ForeignKey('df_goods.GoodsInfo', on_delete=models.CASCADE)
    order = models.ForeignKey(OrderInfo, on_delete=models.CASCADE)
    # 单价price保存为字段方便调整价格
    price = models.DecimalField(max_digits=5, decimal_places=2)
    count = models.IntegerField()