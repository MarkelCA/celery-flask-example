#!/usr/bin/env sh

mkdir -p /var/run/celery /var/log/celery
chown -R nobody:nogroup /var/run/celery /var/log/celery

celery --app=app.celery worker \
            --loglevel=INFO --logfile=/var/log/celery/worker-example.log \
            --uid=nobody --gid=nogroup &
python3 app.py

