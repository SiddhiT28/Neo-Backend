# Generated by Django 4.0.4 on 2022-05-07 11:44

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0020_order_quantity_remove_order_products_order_products'),
    ]

    operations = [
        migrations.CreateModel(
            name='Retailer',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100)),
                ('email', models.EmailField(max_length=100)),
                ('password', models.CharField(max_length=100)),
                ('phonenumbers', models.IntegerField(max_length=100)),
                ('companyName', models.CharField(max_length=100)),
                ('companyAddress', models.CharField(max_length=100)),
                ('bankDetails', models.CharField(max_length=100)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
            ],
        ),
    ]