FROM docker.io/python:3.10.0b3-slim-buster
RUN apt-get update -y && apt-get install -y build-essential libpq-dev=11.12-0+deb10u1
RUN pip3 install mlflow==1.18.0 psycopg2==2.9.1
ENV BACKEND_STORE_URI=""
ENV DEFAULT_ARTIFACT_ROOT="/opt/artifact"
EXPOSE 5000
CMD mlflow server --host 0.0.0.0 --port 5000 --backend-store-uri $BACKEND_STORE_URI --default-artifact-root $DEFAULT_ARTIFACT_ROOT

