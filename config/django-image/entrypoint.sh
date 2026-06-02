#!/bin/bash
set -e

cd /app

if [ ! -f manage.py ]; then
  django-admin startproject core .
fi

python manage.py makemigrations || true
python manage.py migrate || true

python manage.py shell -c "from django.contrib.auth import get_user_model; import os; User = get_user_model(); username = os.environ.get('DJANGO_SUPERUSER_USERNAME'); email = os.environ.get('DJANGO_SUPERUSER_EMAIL'); password = os.environ.get('DJANGO_SUPERUSER_PASSWORD'); User.objects.filter(username=username).exists() or User.objects.create_superuser(username, email, password)" || true

python manage.py runserver 0.0.0.0:8000