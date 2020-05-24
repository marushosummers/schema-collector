# -*- coding: utf-8 -*-

from setuptools import setup, find_packages

with open('README.md') as f:
    readme = f.read()

# See Pipfile for checking dependencies
setup(
    name='python-repository-template',
    version='0.1.0',
    description='fill me',
    long_description=readme,
    url='https://github.com/estie-inc/rename_me',
    packages=find_packages(exclude=('tests', 'docs'))
)
