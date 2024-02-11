from celery import shared_task
from flask import Flask, request
from time import sleep

app = Flask(__name__)
app.config.from_mapping(
    CELERY=dict(
        broker_url="redis://redis:6379",
        result_backend="redis://redis:6379",
        task_ignore_result=True,
    ),
)


@shared_task(ignore_result=False)
def add_together(a: int, b: int) -> int:
    sleep(5)
    return a + b

@app.post("/add")
def start_add() -> dict[str, object]:
    a = request.form.get("a", type=int)
    b = request.form.get("b", type=int)
    result = add_together.delay(a, b)
    return {"result_id": result.id}

