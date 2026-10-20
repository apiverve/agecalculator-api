from setuptools import setup, find_packages

setup(
    name='apiverve_agecalculator',
    version='1.2.2',
    packages=find_packages(),
    include_package_data=True,
    install_requires=[
        'requests',
        'setuptools'
    ],
    description='Age Calculator converts a date of birth into exact age broken down by years, months, weeks, days, hours, minutes, and seconds. It also provides the age in written words and a countdown to the next birthday.',
    author='APIVerve',
    author_email='hello@apiverve.com',
    url='https://apiverve.com/marketplace/agecalculator?utm_source=pypi&utm_medium=referral&utm_content=homepage',
    classifiers=[
        'Programming Language :: Python :: 3',
        'Operating System :: OS Independent',
    ],
    python_requires='>=3.6',
)
