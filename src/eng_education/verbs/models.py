# -*- coding: utf-8 -*-
from django.db import models


class Verb(models.Model):
    infinitive = models.CharField(verbose_name=u'Неопределённая форма', max_length=255, unique=True)
    past_simple = models.CharField(verbose_name=u'Простое прошедшее', max_length=255)
    past_participle = models.CharField(verbose_name=u'Причастие прошедшего времени', max_length=255)
    rus = models.CharField(verbose_name=u'Русский перевод', max_length=255)
    publish = models.BooleanField(default=True)

    class Meta:
        verbose_name = u'Неправильный глагол'
        verbose_name_plural = u'Неправильные глаголы'

    @classmethod
    def get_random_verb(cls):
        try:
            return cls.objects.all().order_by('?')[0]
        except IndexError:
            return None
