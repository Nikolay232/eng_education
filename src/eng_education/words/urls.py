# -*- coding: utf-8 -*-
from django.conf.urls import patterns, url

from eng_education.words.views import WordView, RepeatErrorWordView, RussianWordView


urlpatterns = patterns(
    '',
    url(r'/error_word/(?P<pk>\d+)/$', RepeatErrorWordView.as_view(), name='repeat_error_word'),
    url(r'/russian_word/(?P<pk>\d+)/$', RussianWordView.as_view(), name='russian_word'),
    url(r'/(?P<pk>\d+)/$', WordView.as_view(), name='word'),
)