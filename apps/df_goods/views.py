from django.shortcuts import render
from df_goods import models
from django.core.paginator import Paginator


def index(request):
    """首页视图"""

    # 获取所有商品类型，列表
    gtypes = models.GoodsType.objects.all()

    # 用一访问多的方式获取商品对象列表，并按要求排序和限制显示数量
    # 商品种类固定不变，没必要先循环商品种类列表再循环商品对象列表
    # 索引获取每个商品种类，然后获取商品对象列表
    # type0x为3个热点商品，按照点击量（倒序）排序
    # type00x为4个推荐商品，按照添加时间（倒序）排序
    type01 = gtypes[0].goodsinfo_set.all().order_by('-gclick')[:3]
    type001 = gtypes[0].goodsinfo_set.all().order_by('-id')[:4]
    type02 = gtypes[1].goodsinfo_set.all().order_by('-gclick')[:3]
    type002 = gtypes[1].goodsinfo_set.all().order_by('-id')[:4]

    # 获取session的user_id值，判断用户是否登录，session是个字典可以用has_key()更规范
    if request.session.get('user_id'):
        # 通过user_id查询购物车模块的数据库获取商品对象的数量，未登录显示数量0
        count = 1
    else:
        count = 0

    context = {
        "title": "首页",
        "search_type": 1,
        "gtypes": gtypes,
        "type01": type01,
        "type001": type001,
        "type02": type02,
        "type002": type002,
        "count": count,
    }
    return render(request, "df_goods/index.html", context)


def goods_list(request, tid, sort, pindex):
    """商品列表视图"""
    
    # 根据传入的tid查询数据库商品种类，获得商品对象列表
    goods_type = models.GoodsType.objects.filter(id=tid).first()
    # 建立查询集缓存，在此基础上排序不必反复访问数据库
    goods_list = goods_type.goodsinfo_set.all()
    
    # 新品推荐按照添加时间和3个数量进行排序
    recommend = goods_list.order_by("-id")[:3]

    # 根据传入的sort改变排序方式，默认按照名称、价格、人气进行排序
    if sort == "0":
        glist = goods_list.order_by("gtitle")
    elif sort == "1":
        glist = goods_list.order_by("-gprice")
    elif sort == "2":
        glist = goods_list.order_by("-gclick")

    # 分页，根据商品对象个数计算出需要多少页面，根据当前页面pindex获取页码对象操作翻页
    paginator = Paginator(glist, 2)
    page = paginator.page(int(pindex))

    # 获取session的user_id值，判断用户是否登录，session是个字典可以用has_key()更规范
    if request.session.get('user_id'):
        # 通过user_id查询购物车模块的数据库获取商品对象的数量，未登录显示数量0
        count = 1
    else:
        count = 0

    context = {
        "title": "列表页",
        "search_type": 1,
        "sort": sort,
        "page": page,
        "goods_type": goods_type,
        "recommend": recommend,
        "count": count,
    }
    return render(request, "df_goods/list.html", context)


def goods_detail(request, gid):
    """商品详情视图"""

    # 根据传入的gid作为商品id查询数据库
    gobj = models.GoodsInfo.objects.filter(id=gid).first()
    # 按照所有商品添加顺序-id排序后推荐2个
    recommend = models.GoodsInfo.objects.all().order_by("-id")[:2]

    # 增加点击量，保存到数据库
    gobj.gclick += 1
    gobj.save()

    # 获取session的user_id值，判断用户是否登录，session是个字典可以用has_key()更规范
    if request.session.get('user_id'):
        # 通过user_id查询购物车模块的数据库获取商品对象的数量，未登录显示数量0
        count = 1
    else:
        count = 0

    context = {
        "title": "商品详情",
        "search_type": 1,
        "gobj": gobj,
        "recommend": recommend,
        "count": count,
    }

    return render(request, "df_goods/detail.html", context)
