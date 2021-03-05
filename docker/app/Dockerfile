FROM python:3.9.1-buster
ENV PYTHONUNBUFFERED 1

RUN mkdir -p /app /code
RUN apt update && \
    apt install -y default-mysql-client && \
    apt clean

COPY requirements.txt /app/
WORKDIR /app
RUN pip install -r requirements.txt

WORKDIR /code
