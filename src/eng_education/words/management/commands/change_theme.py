# -*- coding: utf-8 -*-
import json
import random

from django.core.management.base import NoArgsCommand
from django.conf import settings

from eng_education.words.models import Word
from eng_education.verbs.models import Verb
from eng_education.theme.models import Theme


class Command(NoArgsCommand):

    def handle_noargs(self, *args, **kwargs):
        # REMOVE
        # themes = Theme.objects.all()
        # for theme in themes:
        #     words = theme.words_theme.all()
        #     for word in words:
        #         if word.incorrect_amount > 0:
        #             theme.words_theme.remove(word)
        # ADD
        error_theme = Theme.objects.get(id=46)
        words = Word.objects.filter(incorrect_amount__gt=0)
        error_theme.words_theme.add(*words)
