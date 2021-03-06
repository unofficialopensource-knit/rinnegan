FROM python:3.8.2

LABEL maintainer="onlinejudge95<onlinejudge95@gmail.com>"

WORKDIR /usr/src/app

RUN apt-get update && \
    apt-get install gcc python3-dev libpq-dev

COPY ./requirements.txt .

COPY ./requirements-dev.txt .

RUN pip install --upgrade pip setuptools wheel && \
    pip install --requirement requirements.txt

COPY . .

RUN chmod +x entrypoint.sh

ENTRYPOINT [ "./entrypoint.sh" ]
