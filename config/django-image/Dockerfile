FROM python:3.12.2-bookworm

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

COPY config/django-image/requirements.txt /tmp/requirements.txt
RUN pip install --no-cache-dir -r /tmp/requirements.txt

COPY config/django-image/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh