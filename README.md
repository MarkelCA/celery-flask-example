# celery-flask-example
Playing with task-queues and long-running processes

## Install
```
pip install -r requirements.txt
pip install "celery[redis]"
```

## Usage
```
celery -A app.celery worker --loglevel INFO
python3 app.py
```

## Redis task meta storage
```
redis-cli
get celery-task-meta-<task id>
```

