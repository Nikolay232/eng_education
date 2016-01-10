# -*- coding: utf-8 -*-
import os
import sys


PROJECT_ROOT = os.path.dirname(os.path.abspath(__file__))

DEBUG = True
TEMPLATE_DEBUG = DEBUG

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'HOST': 'localhost',
        'PORT': '5432',
        'NAME': 'eng_education',
        'USER': 'eng_education.app',
        'PASSWORD': '123',
    }
}

ADMINS = (
    ('Nikolay Kotov', 'mikola1717@gmail.com'),
)

MANAGERS = ADMINS

ALLOWED_HOSTS = ['*']

TIME_ZONE = 'Europe/Moscow'
LANGUAGE_CODE = 'ru-RU'
DATE_FORMAT = 'd.m.Y'

SITE_ID = 1
USE_I18N = True
USE_L10N = True
USE_TZ = True

MEDIA_ROOT = ''
MEDIA_URL = ''

STATIC_ROOT = '/static/'
# _PATH = os.path.abspath(os.path.dirname(__file__))
# STATIC_ROOT = os.path.join(_PATH, 'files', 'static')
STATIC_URL = '/static/'
STATICFILES_DIRS = ('/home/niko/projects/eng_education/eng_education/src/eng_education/static',)
STATICFILES_STORAGE = 'django.contrib.staticfiles.storage.ManifestStaticFilesStorage'

ROOT_URLCONF = 'eng_education.urls'

SECRET_KEY = 'ttr49lqj%fnvl*j1z%fl01%%xi6@lb&le+#tb0x&-@o71gh_cpoor947'

WSGI_APPLICATION = 'eng_education.wsgi.application'

STATICFILES_FINDERS = (
    'django.contrib.staticfiles.finders.FileSystemFinder',
    'django.contrib.staticfiles.finders.AppDirectoriesFinder',
)

TEMPLATE_LOADERS = (
    'django.template.loaders.filesystem.Loader',
    'django.template.loaders.app_directories.Loader',
)

MIDDLEWARE_CLASSES = (
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.auth.middleware.SessionAuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
    'eng_education.middleware.Status',
)

TEMPLATE_DIRS = (
    os.path.join(PROJECT_ROOT, 'templates'),
)

TEMPLATE_CONTEXT_PROCESSORS = (
    'django.core.context_processors.request',
    'django.core.context_processors.media',
    'django.core.context_processors.static',
    'django.contrib.auth.context_processors.auth',
    'django.contrib.messages.context_processors.messages',
)

INSTALLED_APPS = (
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'eng_education.theme',
    'eng_education.profile',
    'eng_education.words',
    'eng_education.verbs',
)

AUTHENTICATION_BACKENDS = (
    'django.contrib.auth.backends.ModelBackend',
)

LOGIN_REDIRECT_URL = '/profile/'
LOGIN_URL = '/'

EXECUTOR_MAX_COUNT = 2147483647
EXECUTOR_MIN_COUNT = 0

LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'filters': {
        'require_debug_false': {
            '()': 'django.utils.log.RequireDebugFalse'
        }
    },
    'formatters': {
        'console': {
            'format': "==> %(message)s"
        }
    },
    'handlers': {
        'mail_admins': {
            'level': 'ERROR',
            'filters': ['require_debug_false'],
            'class': 'django.utils.log.AdminEmailHandler'
        },
        'console': {
            'level': 'DEBUG',
            'class': 'logging.StreamHandler',
            'formatter': 'console',
        },
    },
    'loggers': {
        'eng_education': {
            'handlers': ['console'],
            'level': 'DEBUG',
        },
        'django.request': {
            'handlers': ['mail_admins', 'console'],
            'level': 'ERROR',
            'propagate': True,
        },
    }
}

APPEND_SLASH = True

# TEST_RUNNER = 'django.test.runner.DiscoverRunner'

# Override settings either from production or development config
PRODUCTION_SETTINGS_PATH = SETTINGS_OVERRIDE_PATH = os.environ.get('ENG_EDUCATION_SETTINGS_OVERRIDE_PATH')

if PRODUCTION_SETTINGS_PATH is None:
    DEV_SETTINGS_PATH = os.path.join(PROJECT_ROOT, 'settings_override.py')
    if os.path.exists(DEV_SETTINGS_PATH):
        SETTINGS_OVERRIDE_PATH = DEV_SETTINGS_PATH

if SETTINGS_OVERRIDE_PATH is not None:
    exec open(SETTINGS_OVERRIDE_PATH) in locals()

if 'test' in sys.argv:
    INSTALLED_APPS += ('django_nose',)
    TEST_RUNNER = 'django_nose.NoseTestSuiteRunner'
    NOSE_ARGS = [
        '--testmatch=^test',
    ]
    DATABASES['default']['USER'] = 'test-hh-eng_education.app'
    DATABASES['default']['PASSWORD'] = 123

    DEFAULT_FILE_STORAGE = 'inmemorystorage.storage.InMemoryStorage'
