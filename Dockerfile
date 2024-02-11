FROM python:3.9-alpine
COPY . /app

ENV PYTHONPATH "${PYTHONPATH}:/app/src"

WORKDIR /app

RUN pip install --no-cache-dir \
    -r requirements.txt \
    pip install "celery[redis]"

VOLUME ["/var/log/celery", "/var/run/celery"]

EXPOSE 5000
CMD ["./celery.sh"]
