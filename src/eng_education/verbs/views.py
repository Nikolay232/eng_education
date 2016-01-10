# -*- coding: utf-8 -*-
import csv

from django.contrib import messages
from django.shortcuts import render, redirect, get_object_or_404
from django.views.generic import View, TemplateView
from django.core.urlresolvers import reverse
from django.http import HttpResponseRedirect

from eng_education.verbs.forms import ImportCsvFileForm
from eng_education.verbs.models import Verb


class VerbMixin(object):
    def get_random_verb(self):
        return Verb.get_random_verb()


class VerbView(View, VerbMixin):
    template_name = 'verbs/verb.html'

    # @method_decorator(login_required)
    def dispatch(self, request, *args, **kwargs):
        self.verb = get_object_or_404(Verb, pk=int(kwargs.get('pk')))

        return super(VerbView, self).dispatch(request, *args, **kwargs)

    def get(self, *args, **kwargs):
        data = {
            'verb': self.verb,
            'verb_id': self.verb.id
        }
        self.verb.correct_amount += 1
        self.verb.save()

        return render(self.request, self.template_name, data)

    def post(self, *args, **kwargs):
        if all([self.request.POST.get('eng_verb_infinitive') == self.verb.infinitive,
                self.request.POST.get('eng_verb_past_simple') == self.verb.past_simple,
                self.request.POST.get('eng_verb_past_participle') == self.verb.past_participle
                ]):
            return HttpResponseRedirect(reverse('verb_view', kwargs={'pk': Verb.get_random_verb().id}))
        else:
            self.verb.incorrect_amount += 1
            self.verb.save()
            return render(
                self.request,
                'verbs/verb_error.html',
                {'verb': self.verb}
            )


class ImportVerbsView(TemplateView):
    template_name = 'admin/verbs/import_from_csv.html'

    # @method_decorator(login_required)
    # def dispatch(self, request, *args, **kwargs):
    #     self.themes = Theme.get_publish_themes()
    #     self.word = Word.objects.filter(id=kwargs.get('pk'))[0]
    #
    #     return super(WordView, self).dispatch(request, *args, **kwargs)

    def get_context_data(self, *args, **kwargs):
        data = {
            'app_label': 'verbs',
            'has_change_permission': True,
            'opts': {'verbose_name_plural': u'Неправильные глаголы', 'app_label': 'verbs'},
            'original': 'Импорт из CSV',
        }
        return super(ImportVerbsView, self).get_context_data(**data)

    def get(self, *args, **kwargs):
        data = self.get_context_data()
        form = ImportCsvFileForm()
        # print data
        data['form'] = form

        return render(
            self.request,
            'admin/verbs/import_from_csv.html',
            data
        )

    def post(self, *args, **kwargs):
        data = self.get_context_data()
        form = ImportCsvFileForm(self.request.POST, self.request.FILES)

        if form.is_valid():
            try:
                spamreader = csv.reader(form.cleaned_data['file'], delimiter=',', quotechar='"')
                spamreader.next()
            except Exception:
                messages.add_message(self.request, messages.ERROR, u'Во время чтения файла произошла ошибка. Импорт не был произведён.')
                data['form'] = form
                return render(
                    self.request,
                    'admin/verbs/import_from_csv.html',
                    data
                )

            value_error = False
            data = []

            for row in spamreader:
                if len(row) == 4:
                    try:
                        Verb.objects.get(infinitive=row[0])
                    except Verb.DoesNotExist:
                        Verb.objects.create(
                            infinitive=row[0],
                            past_simple=row[1],
                            past_participle=row[2],
                            rus=row[3],
                            publish=True
                        )

            return redirect('admin:verbs_verbs_changelist')
