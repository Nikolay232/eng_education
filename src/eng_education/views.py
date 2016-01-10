# -*- coding: utf-8 -*-
from logging import getLogger

from django.template.loader import render_to_string
from django.http import HttpResponse
from django.shortcuts import render
from django.views.generic import TemplateView

from eng_education import package_name, package_version, package_buildtime
from eng_education.utils import _db_status
from eng_education.words.models import Word
from eng_education.verbs.models import Verb
from eng_education.theme.models import Theme


logger = getLogger('eng_education')


class IndexView(TemplateView):
    template_name = 'index.html'

    def get(self, *args, **kwargs):
        themes = Theme.get_publish_themes()
        data = {
            'word_id': Word.get_random_word(themes).id,
            'repeat_word_id': Word.get_repeat_random_word(themes).id,
            'verb_id': Verb.get_random_verb().id
        }

        return render(self.request, self.template_name, data)


def status(request):
    xml = render_to_string('status.xml', {'package_name': package_name,
                                          'package_version': package_version,
                                          'package_buildtime': package_buildtime,
                                          'db_status': _db_status(),
                                          })

    return HttpResponse(xml, content_type="text/xml")
