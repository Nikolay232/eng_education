# -*- coding: utf-8 -*-
from django.conf.urls import patterns, include, url
from django.contrib import admin
from django.conf import settings

from eng_education.words.views import WordView


urlpatterns = patterns(
    '',
    url(r'/(?P<pk>\d+)/$', WordView.as_view(), name='word'),
)