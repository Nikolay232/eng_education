# -*- coding: utf-8 -*-
from django import forms


class ImportCsvFileForm(forms.Form):
    file = forms.FileField(widget=forms.FileInput(), label=u'Выберите файл для импорта')
