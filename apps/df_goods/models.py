from django.db import models

class GoodsType(models.Model):
    """商品种类模型类"""
    gtype = models.CharField(max_length=32)
    is_delete = models.BooleanField(default=False)

    def __str__(self):
        return self.gtype


class GoodsInfo(models.Model):
    """商品信息模型类"""
    gtitle = models.CharField(max_length=32)
    gpic = models.ImageField(upload_to='images/df_goods', default='')
    gprice = models.DecimalField(max_digits=5, decimal_places=2)
    gunit = models.CharField(max_length=32)
    gstock = models.IntegerField()
    gsummary = models.CharField(max_length=100)
    gdetail = models.CharField(max_length=200)
    gclick = models.IntegerField(default=0)
    is_delete = models.BooleanField(default=False)
    gtype = models.ForeignKey(to=GoodsType, on_delete=models.CASCADE)

    def __str__(self):
        return self.gtitle

