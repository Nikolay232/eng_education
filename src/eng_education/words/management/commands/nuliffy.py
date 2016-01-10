# -*- coding: utf-8 -*-
from django.core.management.base import NoArgsCommand

from eng_education.words.models import Word
from eng_education.verbs.models import Verb

class Command(NoArgsCommand):

    def handle_noargs(self, *args, **kwargs):
        Word.objects.all().update(amount=0, incorrect_amount=0, repeat_amount=0)
        Verb.objects.all().update(correct_amount=0, incorrect_amount=0)
