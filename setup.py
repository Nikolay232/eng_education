#!/usr/bin/env python
import sys

from setuptools import setup, find_packages

if sys.argv[1] == 'develop':
    import multiprocessing
else:
    pass


requires = [
    'django > 1.8, < 1.8.9',
    'psycopg2'
]

dependencies = []

setup(
    name='eng_education',
    version='0.1',
    description='eng_education',
    keywords='web django hh',
    packages=find_packages('src'),
    package_dir={'': 'src'},
    zip_safe=False,
    include_package_data=True,
    author='Eastwood Lab',
    install_requires=requires,
    dependency_links=dependencies,
    extras_require={
        'develop': [
            'nose-subunit',
            'django-nose',
            'django-debug-toolbar',
            'ipdb',
        ]
    },
    classifiers=[
        "Programming Language :: Python :: 2.7",
        "Framework :: Django",
        "Topic :: Internet :: WWW/HTTP",
        "Topic :: Internet :: WWW/HTTP :: WSGI :: Application",
    ],
    entry_points={
        'console_scripts': [
            'enged = eng_education.manage:main',
        ]
    }
)
