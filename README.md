# celery-flask-example
Playing with task-queues and long-running processes. Uses Redis as storage for the task metadata.

## Requirements
- [Redis](https://redis.io/docs/install/install-redis/)
- [Celery](https://docs.celeryq.dev/en/stable/getting-started/introduction.html#installation)

## Install
```bash
pip install -r requirements.txt
pip install "celery[redis]"
```

## Usage
Init the celery worker and the flask API.
```bash
celery -A app.celery worker --loglevel INFO
python3 app.py
```
Trigger the task
```bash
curl -X POST localhost:5000/add -d "a=50" -d "b=10"
```

## Inspect task metadata
```
redis-cli
get celery-task-meta-<task id>
```

