from django.contrib import admin
from .models import GoodsType, GoodsInfo


class GoodsInfoAdmin(admin.ModelAdmin):
    list_display = ['id', 'gtitle', 'gprice', 'gstock', 'gclick', 'gtype', 'is_delete']
    list_filter = ['gtype', 'is_delete']
    search_fields = ['gtitle', 'gsummary', 'gdetail']
    

admin.site.register(GoodsType)
admin.site.register(GoodsInfo, GoodsInfoAdmin)