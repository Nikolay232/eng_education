# -*- coding: utf-8 -*-
from django.contrib import admin

from eng_education.words.models import Word


class WordAdmin(admin.ModelAdmin):
    list_display = ('eng', 'amount', 'incorrect_amount', 'repeat_amount', 'publish', 'rus')
    search_fields = ('eng', 'rus', 'theme__title')
    list_filter = ('publish', )
    filter_horizontal = ('theme', )


admin.site.register(Word, WordAdmin)
