# -*- coding: utf-8 -*-
import re

from eng_education.views import status


class Status:
    def process_request(self, request):
        if re.match(r'^/status/?$', request.path):
            return status(request)
