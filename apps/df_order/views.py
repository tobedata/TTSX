from django.shortcuts import render, redirect
from django.db import transaction
from decimal import Decimal

from df_cart.models import CartInfo
from df_user.models import UserInfo
from .models import OrderInfo, OrderDetail
from datetime import datetime


def place_order(request):
    """提交订单页面"""

    # 查询用户对象
    user = UserInfo.objects.get(id=request.session['user_id'])

    # 根据url参数查询购物车信息
    cids = request.GET.getlist('cart_id')
    # 字符串列表['1', '2', '3']转换为数字列表[1, 2, 3]
    cids1 = [int(i) for i in cids]
    cobj = CartInfo.objects.filter(id__in=cids1)

    # 拼接购物车id成字符串，用于正式提交时，['1', '2', '3']-->'1, 2, 3'
    cart_ids = ','.join(cids)

    context = {
        "title": "用户订单",
        "search_type": 0,
        "user": user,
        "cobj": cobj,
        'cart_ids': cart_ids,
    }
    return render(request, 'df_order/place_order.html', context)


'''
事务：一旦操作失败，全部回退
1.创建订单对象
2.判断商品的库存
3.创建详单对象
4.修改商品库存
5.删除购物车
'''

@transaction.atomic()
def order_handle(request):
    """订单提交处理"""
    # 事务回滚点
    tran_id = transaction.savepoint()

    try:
        # 创建订单对象
        order = OrderInfo()
        now = datetime.now()
        uid = request.session['user_id']
        order.oid = '%s%d' % (now.strftime('%Y%m%d%H%M%S'), uid)  # 时间对象转换为字符串
        order.user_id = uid
        order.odate = now
        order.ototal = Decimal(request.POST.get('total'))  # 转换为Decimal对象
        order.oaddress = UserInfo.objects.get(id=int(uid)).recv_addr
        order.save()

        # 接收购物车编号
        cart_ids = request.POST.get('cart_ids')
        # 字符串转换为列表，'1, 2, 3'-->['1', '2', '3']
        cids = cart_ids.split(',')
        # 遍历购物车id列表，创建每一个详单对象
        for id1 in cids:
            detail = OrderDetail()
            detail.order = order
            # 查询购物车信息
            cart = CartInfo.objects.get(id=id1)
            # 完善详单信息
            detail.goods_id = cart.goods_id
            detail.price = cart.goods.gprice
            detail.count = cart.count
            detail.save()
            # 删除购物车数据
            cart.delete()
        # 数据库操作没有问题，提交事务
        transaction.savepoint_commit(tran_id)
    except Exception as e:
        print('===========%s' % e)
        transaction.savepoint_rollback(tran_id)

    return redirect('/user/center_order/')