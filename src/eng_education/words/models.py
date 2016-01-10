# -*- coding: utf-8 -*-
from django.db import models
from django.db.models import Min

from eng_education.theme.models import Theme


class Word(models.Model):
    eng = models.TextField(verbose_name=u'Английский перевод')
    rus = models.TextField(verbose_name=u'Русский перевод')
    theme = models.ManyToManyField(Theme, verbose_name=u'Тема слова',
                                   related_name='words_theme')
    publish = models.BooleanField(default=True)
    amount = models.IntegerField(null=True, blank=True, verbose_name=u'Количество', default=0)
    incorrect_amount = models.IntegerField(null=True, blank=True, verbose_name=u'Неверные ответы', default=0)
    repeat_amount = models.IntegerField(null=True, blank=True, verbose_name=u'Количество повторов', default=0)

    class Meta:
        unique_together = ('eng', 'rus')
        verbose_name = u'Слово'
        verbose_name_plural = u'Слова'

    @classmethod
    def get_random_word(cls, themes):
        try:
            words = cls.objects.filter(
                theme__in=themes,
                publish=True
            ).aggregate(Min('amount'))
            return cls.objects.filter(theme__in=themes).filter(
                amount=words['amount__min'],
                publish=True
            ).order_by('?')[0]
        except IndexError:
            return None

    @classmethod
    def get_repeat_random_word(cls, themes):
        try:
            words = cls.objects.filter(
                theme__in=themes,
                publish=True,
                incorrect_amount__gte=1
            ).aggregate(Min('repeat_amount'))

            if words['repeat_amount__min'] is None:
                return cls.objects.filter(theme__in=themes).filter(
                    publish=True
                ).order_by('?')[0]

            return cls.objects.filter(theme__in=themes).filter(
                repeat_amount=words['repeat_amount__min'],
                incorrect_amount__gte=1,
                publish=True
            ).order_by('?')[0]
        except IndexError:
            return None

    def increment_count(self):
        self.amount += 1
        self.save()

    def increment_incorrect_amount(self):
        self.incorrect_amount += 1
        self.save()

    def increment_repeat_incorrect_amount(self):
        self.repeat_amount += 1
        self.save()
