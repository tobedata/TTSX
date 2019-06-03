from django.shortcuts import render, redirect
from django.http import JsonResponse, HttpResponse
from hashlib import sha1
from df_user import models
import json


def login(request):
    """登录页"""
    # 获取cookie值，没有默认为空字符串
    uname = request.COOKIES.get('uname', '')

    context = {
        'title': '登录',
        'uname': uname,
    }

    return render(request, 'df_user/login.html', context)


def login_handle(request):
    """处理登录验证"""
    uname = request.POST.get('username')
    upwd = request.POST.get('pwd')
    status = request.POST.get('remember')

    # 数据库保存的是加密过的密码，POST获取的密码需先加密再和数据库保存的密码进行比对
    m = sha1()
    m.update(upwd.encode('utf-8'))
    encrypt_pwd = m.hexdigest()

    # 查询数据库进行验证，first()直接获取用户对象
    u_obj = models.UserInfo.objects.filter(uname=uname).first()

    # 设置判断结果标识，用于返回ajax回调函数，True表示信息正确
    user_error = False
    pwd_error = False

    # 需要添加cookies信息和session信息，构造响应对象
    response = HttpResponse()

    if u_obj:
        # 用户名正确
        user_error = True

        if u_obj.upwd == encrypt_pwd:
            # 密码正确
            pwd_error = True

            # 判断是否勾选记住用户名，checkbox标签勾选value="1"
            if status == "1":
                # cookie设置用户名
                response.set_cookie('uname', uname)
            else:
                response.delete_cookie('uname')

            # 登录状态，保存用户id到session，用于其他页面先判断有无session，再在登录状态下利用用户id查询数据库，用户名大量使用保存在session避免反复查询数据库
            request.session['user_id'] = u_obj.id
            request.session['user_name'] = u_obj.uname

            # 用户名和密码都正确
            content = {'user_error': user_error, 'pwd_error': pwd_error}
            # 必须以JSON格式返回
            response.content = json.dumps(content)

            return response
        else:
            # 密码错误
            content = {'user_error': user_error, 'pwd_error': pwd_error}
            response.content = json.dumps(content)

            return response
    else:
        # 用户名不存在
        content = {'user_error': user_error, 'pwd_error': pwd_error}
        response.content = json.dumps(content)

        return response


def register(request):
    """注册页"""
    context = {
        'title': '注册',
    }

    return render(request, 'df_user/register.html', context)


def register_exist(request):
    """验证用户名是否存在"""
    # 接收ajax提交的请求
    uname = request.GET.get("user_name")

    # 查询数据库，判断用户是否存在，不需要返回具体的查询对象，简单利用count()计数结果做判断
    # 需json格式数据给ajax回调函数，JsonResponse必须接收字典参数
    count = models.UserInfo.objects.filter(uname=uname).count()
    if count:
        return JsonResponse({'count': True})
    else:
        return JsonResponse({'count': False})


def register_handle(request):
    """处理注册信息"""
    uname = request.POST.get("user_name")
    upwd = request.POST.get("pwd")
    cpwd = request.POST.get("cpwd")
    uemail = request.POST.get("email")
    allow = request.POST.get("allow")
    print(uname, upwd, cpwd, uemail, allow)

    # 再次判断两次密码是否相同，很有必要
    if upwd != cpwd:
        return redirect('/register/')
    else:
        # 敏感数据加密处理
        m = sha1()
        m.update(upwd.encode('utf-8'))
        encypt_pwd = m.hexdigest()
        print(encypt_pwd)

        # 数据入库，模型类数据结构[<UserInfo: UserInfo object (3)>,]，利用对象属性赋值
        user_obj = models.UserInfo()
        user_obj.uname = uname
        user_obj.upwd = encypt_pwd
        user_obj.uemail = uemail
        user_obj.save()

    return redirect('/login/')


def user_center_info(request):
    """个人中心-个人信息页"""
    username = request.session.get('user_name')

    if username == None:
        return redirect('/login/')
    else:
        user_obj = models.UserInfo.objects.get(id=request.session.get('user_id'))
        print(user_obj)
        context = {
            'title': '个人信息',
            'username': username,
            'user_obj': user_obj,
            'search_type': 0,
        }

        return render(request, 'df_user/user_center_info.html', context)


def user_center_site(request):
    """个人中西-收货地址页"""
    user_id = request.session.get('user_id')

    if request.method == 'GET':
        if user_id == None:
            return redirect('/login')
        else:
            user_obj = models.UserInfo.objects.get(id=user_id)
            context = {
                'title': '收货地址',
                'user_obj': user_obj,
                'search_type': 0,
            }
            return render(request, 'df_user/user_center_site.html', context)
    elif request.method == 'POST':
        
        user_dic = {
            'recv_name': request.POST.get('recv_name'),
            'recv_addr': request.POST.get('recv_addr'),
            'recv_code': request.POST.get('recv_code'),
            'uphone': request.POST.get('uphone'),
        }
        user_obj = models.UserInfo.objects.filter(id=user_id)
        user_obj.update(**user_dic)

        return redirect('/user/center_site/')