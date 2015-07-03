# -*- coding: utf-8 -*-
from django.db import models


class Theme(models.Model):
    title = models.TextField(verbose_name=u'Название темы', unique=True)
    publish = models.BooleanField(default=False)

    class Meta:
        verbose_name = u'Тема'
        verbose_name_plural = u'Темы'

    def __unicode__(self):
        return self.title

    @classmethod
    def get_publish_themes(cls):
        return cls.objects.filter(publish=True)
