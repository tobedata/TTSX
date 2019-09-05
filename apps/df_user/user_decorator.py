from django.shortcuts import redirect

def verifylogin(func):
    """装饰器，验证登录功能"""
    def inner(request, *args, **kwargs):
        """判断登录状态"""
        if request.session.has_key('user_id'):
            ret = func(request, *args, **kwargs)
            return ret
        else:
            res = redirect('/login/')
            url = request.get_full_path()
            res.set_cookie('url', value=url)
            return res
    return inner
