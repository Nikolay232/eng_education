# -*- coding: utf-8 -*-
from django.contrib import admin

from eng_education.theme.models import Theme


class ThemeAdmin(admin.ModelAdmin):
    search_fields = ('title', )
    list_display = ('title', 'publish')
    list_filter = ('publish', )


admin.site.register(Theme, ThemeAdmin)
