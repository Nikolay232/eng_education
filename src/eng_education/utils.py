# -*- coding: utf-8 -*-
import psycopg2

from django.db.utils import DatabaseError
from django.db import connections


_FAILURE = 'failure'
_SUCCESS = 'success'


def _db_status():
    try:
        connections['default'].cursor()
    except (DatabaseError, psycopg2.Error):
        return _FAILURE
    else:
        return _SUCCESS
