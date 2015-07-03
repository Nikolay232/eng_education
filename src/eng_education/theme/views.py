# -*- coding: utf-8 -*-
from django.contrib.auth.decorators import login_required
from django.db import transaction
from django.shortcuts import render
from django.utils.decorators import method_decorator
from django.views.generic import View


class ProfileIndexView(View):
    @method_decorator(login_required)
    def dispatch(self, request, *args, **kwargs):
        return super(ProfileIndexView, self).dispatch(request, *args, **kwargs)

    @method_decorator(transaction.atomic)
    def get(self, *args, **kwargs):
        template_name = 'profile/profile.html'

        return render(self.request, template_name, {})
