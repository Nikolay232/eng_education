# -*- coding: utf-8 -*-
import random

from django.shortcuts import render, get_object_or_404
from django.views.generic import View
from django.core.urlresolvers import reverse
from django.http import HttpResponseRedirect

from eng_education.theme.models import Theme
from eng_education.words.models import Word


class WordMixin(object):
    def get_random_word(self):
        return Word.get_random_word(self.themes)

    def get_check_word(self):
        if self.word.eng[len(self.word.eng)-1].isdigit():
            return self.word.eng[:-2]
        else:
            return self.word.eng


class WordView(View, WordMixin):
    template_name = 'words/word.html'

    # @method_decorator(login_required)
    def dispatch(self, request, *args, **kwargs):
        self.themes = Theme.get_publish_themes()
        self.word = get_object_or_404(Word, pk=int(kwargs.get('pk')))

        return super(WordView, self).dispatch(request, *args, **kwargs)

    def get(self, *args, **kwargs):
        data = {
            'themes': self.themes,
            'word': self.word,
            'word_id': self.word.id
        }

        return render(self.request, self.template_name, data)

    def post(self, *args, **kwargs):
        if self.request.POST.get('eng_word') == self.get_check_word():
            self.word.increment_count()
            return HttpResponseRedirect(reverse('word', kwargs={'pk': Word.get_random_word(self.themes).id}))
        else:
            self.word.increment_incorrect_amount()
            return render(
                self.request,
                'words/word_error.html',
                {'word': self.word, 'themes': self.themes}
            )


class RepeatErrorWordView(View, WordMixin):
    template_name = 'words/repeat_error_word.html'

    # @method_decorator(login_required)
    def dispatch(self, request, *args, **kwargs):
        self.themes = Theme.get_publish_themes()
        self.word = get_object_or_404(Word, pk=int(kwargs.get('pk')))

        return super(RepeatErrorWordView, self).dispatch(request, *args, **kwargs)

    def get(self, *args, **kwargs):
        data = {
            'themes': self.themes,
            'word': self.word,
            'word_id': self.word.id
        }

        return render(self.request, self.template_name, data)

    def post(self, *args, **kwargs):
        if self.request.POST.get('eng_word') == self.get_check_word():
            self.word.increment_repeat_incorrect_amount()
            self.word.increment_count()
            return HttpResponseRedirect(reverse('repeat_error_word', kwargs={'pk': Word.get_repeat_random_word(self.themes).id}))
        else:
            self.word.increment_incorrect_amount()
            return render(
                self.request,
                'words/word_repeat_error.html',
                {'word': self.word, 'themes': self.themes}
            )


class RussianWordView(View, WordMixin):
    template_name = 'words/russian_word.html'

    # @method_decorator(login_required)
    def dispatch(self, request, *args, **kwargs):
        self.themes = Theme.get_publish_themes()
        self.word = get_object_or_404(Word, pk=int(kwargs.get('pk')))

        return super(RussianWordView, self).dispatch(request, *args, **kwargs)

    def _get_random_translate(self, count=5):
        translate_words_list = list(Word.objects.filter(id=self.kwargs['pk']))
        translate_words_list.extend(Word.objects.exclude(id=self.kwargs['pk']).order_by('?')[:count])
        random.shuffle(translate_words_list)

        return translate_words_list

    def get(self, *args, **kwargs):
        data = {
            'themes': self.themes,
            'word': self.word,
            'word_id': self.word.id,
            'random_words': self._get_random_translate()
        }

        return render(self.request, self.template_name, data)

    def post(self, *args, **kwargs):
        # rus_word = self.request.POST.get('rus_word')

        # if rus_word and rus_word in self.word.rus:
        if self.kwargs['pk'] in self.request.POST:
            self.word.increment_count()
            return HttpResponseRedirect(reverse('russian_word', kwargs={'pk': Word.get_random_word(self.themes).id}))
        else:
            self.word.increment_incorrect_amount()
            return render(
                self.request,
                'words/rus_word_error.html',
                {'word': self.word, 'themes': self.themes}
            )
