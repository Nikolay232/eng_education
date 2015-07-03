# -*- coding: utf-8 -*-
from django.contrib import admin

from eng_education.profile.models import UserProfile


class UserProfileAdmin(admin.ModelAdmin):
    list_display = ('user', )


admin.site.register(UserProfile, UserProfileAdmin)
