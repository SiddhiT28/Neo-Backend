# Generated by Django 4.0.4 on 2022-05-07 12:17

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0027_alter_product_vendor'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='product',
            name='vendor',
        ),
    ]
