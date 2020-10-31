#!/usr/bin/env python3
# This file if part of the MyGNUHealth, the GNU Health PHR
# www.gnuhealth.org

from setuptools import setup, find_packages

long_desc = open('README.rst').read()

version = open('version').read().strip()

name = 'MyGNUHealth'

download_url = 'https://ftp.gnu.org/gnu/health'

setup(name=name,
    version=version,
    description='The GNU Health Personal Health Record',
    long_description=long_desc,
    author='GNU Solidario',
    author_email='info@gnuhealth.org',
    url='https://www.gnuhealth.org',
    download_url=download_url,
    keywords='eHealth PHR mHealth GNUHealth',
    classifiers=[
        'Development Status :: 3 - Alpha',
        'Environment :: X11 Applications :: KDE',
        'Environment :: X11 Applications :: Qt',
        'Topic :: Desktop Environment :: K Desktop Environment (KDE)',
        'Intended Audience :: Developers',
        'Intended Audience :: End Users/Desktop',
        'Intended Audience :: Healthcare Industry',
        'Intended Audience :: Science/Research',
        'License :: OSI Approved :: GNU General Public License (GPL)',
        'Operating System :: POSIX',
        'Programming Language :: Python :: 3',
        'Topic :: Scientific/Engineering :: Bio-Informatics',
        'Topic :: Scientific/Engineering :: Medical Science Apps.',
        'Natural Language :: English'
        ],
    platforms='any',
    scripts=['bin/mygnuhealth'],
    license='GPL v3+',
    python_requires='>=3.6,<4',
    install_requires=[
        'PySide2',
        'matplotlib',
        "tinydb",
        'bcrypt'
        ],
    packages=find_packages(),
    include_package_data=True,
    zip_safe=False,
)
