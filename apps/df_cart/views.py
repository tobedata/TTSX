from django.shortcuts import render, redirect
from django.http import JsonResponse
from df_user import user_decorator
from .models import CartInfo


@user_decorator.verifylogin
def cart(request):
    """购物车页面"""
    uid = request.session.get('user_id')
    carts = CartInfo.objects.filter(user_id=uid)
    count = len(carts)
    
    context = {
        'title': '购物车',
        'carts': carts,
        'count': count,
    }
    return render(request, 'df_cart/cart.html', context)


@user_decorator.verifylogin
def add(request, gid, num):
    """添加到购物车功能"""
    uid = request.session['user_id']

    # 查询当前用户的购物车里有没有该商品id，直接外键的用字段名访问，先不需要跨表查询
    cart_goods = CartInfo.objects.filter(user_id=uid, goods_id=gid)

    if len(cart_goods) >=1:
        cart = cart_goods[0]
        cart.count += int(num)
    else:
        cart = CartInfo()
        cart.user_id = int(uid)
        cart.goods_id = int(gid)
        cart.count = int(num)
    # 模型类对象save()后才会保存到数据库
    cart.save()

    # 根据请求方式，ajax返回json，get方式重定向页面
    if request.is_ajax():
        count = CartInfo.objects.filter(user_id=uid).count()
        return JsonResponse({'count':count})
    else:
        return redirect('/cart/')


def remove(request):
    """购物车商品删除功能"""
    # 用get获取数据库对象，防止程序中断，要用try
    try:
        # cid最好转换成int再查询数据库
        cid = request.GET.get('cid')
        CartInfo.objects.get(id=int(cid)).delete()
        data = {'ok': 1}
    except Exception as e:
        data = {'ok': 0}
    return JsonResponse(data)


def edit(request, cid, num):
    """失去焦点触发修改功能"""
    try:
        cart = CartInfo.objects.get(id=int(cid))
        # 保存一个修改数据库之前的值count1
        count1 = cart.count
        cart.count = int(num)
        cart.save()
        data = {'ok':0}
    except Exception as e:
        data = {'ok': count1}
    return JsonResponse(data)