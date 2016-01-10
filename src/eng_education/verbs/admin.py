# -*- coding: utf-8 -*-
from django.contrib import admin

from eng_education.verbs.models import Verb


class VerbAdmin(admin.ModelAdmin):
    search_fields = (
        'infinitive',
        'past_simple',
        'past_participle',
        'rus',
    )
    list_display = (
        'infinitive',
        'past_simple',
        'past_participle',
        'rus',
        'publish',
        'correct_amount',
        'incorrect_amount'
    )
    list_filter = ('publish', )


admin.site.register(Verb, VerbAdmin)
