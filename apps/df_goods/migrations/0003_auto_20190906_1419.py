# Generated by Django 2.0 on 2019-09-06 06:19

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('df_goods', '0002_goodsinfo_gpic'),
    ]

    operations = [
        migrations.AlterField(
            model_name='goodsinfo',
            name='is_delete',
            field=models.BooleanField(default=False),
        ),
        migrations.AlterField(
            model_name='goodstype',
            name='is_delete',
            field=models.BooleanField(default=False),
        ),
    ]
