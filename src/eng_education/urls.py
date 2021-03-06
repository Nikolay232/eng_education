# -*- coding: utf-8 -*-
from django.conf.urls import patterns, include, url
from django.contrib import admin
from django.conf import settings

from eng_education.views import IndexView
from eng_education.verbs.views import ImportVerbsView


urlpatterns = patterns(
    '',
    url(r'^$', IndexView.as_view(), name='index'),
    url(r'^word', include('eng_education.words.urls')),
    url(r'^verb', include('eng_education.verbs.urls')),
    url(r'^import_verbs/?', ImportVerbsView.as_view(), name='import_verbs'),
    url(r'^admin/?', include(admin.site.urls)),
    url(r'^logout/$', 'django.contrib.auth.views.logout', name='user_logout', kwargs={'next_page': '/'}),
)

if settings.DEBUG:
    urlpatterns.extend([
        url(r'^static/(?P<path>.*.[css|js|png|ico|jpg|gif|svg|htm|html])$', 'django.views.static.serve', {'document_root': settings.STATIC_ROOT}),
        url(r'^(?P<path>.*.[css|js|png|ico|jpg|gif|svg|htm|html])$', 'django.views.static.serve', {'document_root': settings.STATIC_ROOT}),
    ])
