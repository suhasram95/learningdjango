FROM python:3.6

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        postgresql-client \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt ./

RUN pip install -r requirements.txt

COPY . /app

EXPOSE 8000

CMD ["python", "firstproject/manage.py", "runserver", "0.0.0.0:8000"]
