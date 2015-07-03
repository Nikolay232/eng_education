# -*- coding: utf-8 -*-
from django.conf.urls import patterns, url

from eng_education.profile.views import ProfileIndexView


urlpatterns = patterns(
    '',
    url(r'^$', ProfileIndexView.as_view(), name='profile_index'),
)
