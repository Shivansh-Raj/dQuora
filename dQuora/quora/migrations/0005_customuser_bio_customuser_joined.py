# Generated by Django 4.2.5 on 2024-06-05 06:39

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('quora', '0004_rename_post_comment_post'),
    ]

    operations = [
        migrations.AddField(
            model_name='customuser',
            name='bio',
            field=models.CharField(blank=True, max_length=200, null=True),
        ),
        migrations.AddField(
            model_name='customuser',
            name='joined',
            field=models.DateTimeField(auto_now=True),
        ),
    ]
