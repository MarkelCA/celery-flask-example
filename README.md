# celery-flask-example
Playing with task-queues and long-running processes. Uses Redis as storage for the task metadata.

## Requirements
- [Docker](https://docs.docker.com/get-docker/)


## Usage
Init the containers
```
docker compose up --build
```
Trigger the task
```
curl -X POST localhost:5000/add -d "a=50" -d "b=10"
```

## Inspect task metadata
```
redis-cli -p 6380
get celery-task-meta-<task id>
```

