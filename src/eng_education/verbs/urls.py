# -*- coding: utf-8 -*-
from django.conf.urls import patterns, url

from eng_education.verbs.views import VerbView


urlpatterns = patterns(
    '',
    url(r'/(?P<pk>\d+)/$', VerbView.as_view(), name='verb_view'),
)