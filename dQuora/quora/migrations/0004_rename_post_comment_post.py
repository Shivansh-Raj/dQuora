# Generated by Django 4.2.5 on 2024-06-03 17:33

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('quora', '0003_alter_post_categories'),
    ]

    operations = [
        migrations.RenameField(
            model_name='comment',
            old_name='post',
            new_name='Post',
        ),
    ]