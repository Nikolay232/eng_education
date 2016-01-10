# -*- coding: utf-8 -*-
from django.db import models
from django.db.models import Min


class Verb(models.Model):
    infinitive = models.CharField(verbose_name=u'Неопределённая форма', max_length=255, unique=True)
    past_simple = models.CharField(verbose_name=u'Простое прошедшее', max_length=255)
    past_participle = models.CharField(verbose_name=u'Причастие прошедшего времени', max_length=255)
    rus = models.CharField(verbose_name=u'Русский перевод', max_length=255)
    publish = models.BooleanField(default=True)
    correct_amount = models.IntegerField(null=True, blank=True, verbose_name=u'Верные ответы', default=0)
    incorrect_amount = models.IntegerField(null=True, blank=True, verbose_name=u'Неверные ответы', default=0)

    class Meta:
        verbose_name = u'Неправильный глагол'
        verbose_name_plural = u'Неправильные глаголы'

    @classmethod
    def get_random_verb(cls):
        try:
            verbs_min = cls.objects.filter(publish=True).aggregate(Min('correct_amount'))
            return cls.objects.filter(
                correct_amount=verbs_min['correct_amount__min'],
                publish=True
            ).order_by('?')[0]
        except IndexError:
            return None
