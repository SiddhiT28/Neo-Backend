# Generated by Django 4.0.4 on 2022-05-07 11:45

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0021_retailer'),
    ]

    operations = [
        migrations.AddField(
            model_name='product',
            name='vendor',
            field=models.ForeignKey(default=None, on_delete=django.db.models.deletion.CASCADE, related_name='vendor', to='api.retailer'),
        ),
    ]
