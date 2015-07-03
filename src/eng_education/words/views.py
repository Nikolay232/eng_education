# -*- coding: utf-8 -*-
from django.shortcuts import render
from django.views.generic import View
from django.core.urlresolvers import reverse
from django.http import HttpResponseRedirect

from eng_education.theme.models import Theme
from eng_education.words.models import Word


class WordMixin(object):
    def get_random_word(self):
        return Word.get_random_word(self.themes)


class WordView(View, WordMixin):
    template_name = 'words/word.html'

    # @method_decorator(login_required)
    def dispatch(self, request, *args, **kwargs):
        self.themes = Theme.get_publish_themes()
        self.word = Word.objects.filter(id=kwargs.get('pk'))[0]

        return super(WordView, self).dispatch(request, *args, **kwargs)

    def get(self, *args, **kwargs):
        data = {
            'themes': self.themes,
            'word': self.word,
            'word_id': self.word.id
        }
        self.word.amount += 1
        self.word.save()

        return render(self.request, self.template_name, data)

    def post(self, *args, **kwargs):
        if self.request.POST.get('eng_word') == self.word.eng:
            return HttpResponseRedirect(reverse('word', kwargs={'pk': Word.get_random_word(self.themes).id}))
        else:
            return render(
                self.request,
                'words/word_error.html',
                {'word': self.word, 'themes': self.themes}
            )
