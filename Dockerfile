FROM python:3.9-alpine

COPY . /src

WORKDIR /src

RUN pip install --no-cache-dir \
    -r requirements.txt \
    pip install "celery[redis]"

VOLUME ["/var/log/celery", "/var/run/celery"]

EXPOSE 5000
CMD ["./celery.sh"]
