# 检索df_goods应用，在apps/df_goods目录下创建
from haystack import indexes
from .models import GoodsInfo  # 指定要搜索的模型类

# 类名任意，两个类方法固定
class TestSearchIndex(indexes.SearchIndex, indexes.Indexable):
    text = indexes.CharField(document=True, use_template=True)

    def get_model(self):
        return GoodsInfo  # 返回模型类名

    def index_queryset(self, using=None):
        return self.get_model().objects.all()