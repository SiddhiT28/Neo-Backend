# Generated by Django 4.0.4 on 2022-05-07 12:24

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0028_remove_product_vendor'),
    ]

    operations = [
        migrations.RenameField(
            model_name='retailer',
            old_name='phonenumber',
            new_name='phonenumbers',
        ),
    ]
