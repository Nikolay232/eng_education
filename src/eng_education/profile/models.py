# -*- coding: utf-8 -*-
from django.db import models
from django.contrib.auth.models import User

from eng_education.theme.models import Theme


class UserProfile(models.Model):
    user = models.OneToOneField(User, related_name='profile',
                                verbose_name=u'Логин', unique=True)
    theme = models.OneToOneField(Theme, verbose_name=u'Тема слов',
                                 related_name='profile_theme', null=True, blank=True)

    class Meta:
        verbose_name = 'Профиль пользователя'
        verbose_name_plural = 'Профили пользователей'
