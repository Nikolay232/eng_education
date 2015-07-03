# -*- coding: utf-8 -*-
from django.db import models

from eng_education.theme.models import Theme


class Word(models.Model):
    eng = models.TextField(verbose_name=u'Английский перевод', unique=True)
    rus = models.TextField(verbose_name=u'Русский перевод')
    theme = models.ManyToManyField(Theme, verbose_name=u'Тема слова',
                                   related_name='words_theme')
    publish = models.BooleanField(default=True)
    amount = models.IntegerField(null=True, blank=True, verbose_name=u'Количество')

    class Meta:
        verbose_name = u'Слово'
        verbose_name_plural = u'Слова'

    @classmethod
    def get_random_word(cls, themes):
        try:
            return cls.objects.filter(theme__in=themes).order_by('?')[0]
        except IndexError:
            return None
