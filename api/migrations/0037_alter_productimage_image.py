# Generated by Django 4.0.4 on 2022-05-07 18:12

import api.models
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0036_product_vendor'),
    ]

    operations = [
        migrations.AlterField(
            model_name='productimage',
            name='image',
            field=models.ImageField(default='images/default.png', upload_to=api.models.upload_to),
        ),
    ]