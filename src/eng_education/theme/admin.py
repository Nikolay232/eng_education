# -*- coding: utf-8 -*-
from django.contrib import admin

from eng_education.theme.models import Theme


class ThemeAdmin(admin.ModelAdmin):
    actions = ('make_published', )
    search_fields = ('title', )
    list_display = ('title', 'publish', 'words_count')
    list_filter = ('publish', )

    def words_count(self, obj):
        return obj.words_theme.all().count()

    def make_published(modeladmin, request, queryset):
        Theme.objects.all().update(publish=False)
        queryset.update(publish=True)
    make_published.short_description = u'Опубликовать'


admin.site.register(Theme, ThemeAdmin)
