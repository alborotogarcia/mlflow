FROM docker.io/python:3.9.7-slim-buster
RUN apt-get update; apt-get install -y build-essential libpq-dev=11.12-0+deb10u1;  rm -rf /var/lib/apt/lists/*;
RUN pip3 install --no-cache-dir mlflow==1.20.2 psycopg2==2.9.1
ARG BACKEND_STORE_URI
ARG DEFAULT_ARTIFACT_ROOT
ENV BACKEND_STORE_URI=$BACKEND_STORE_URI DEFAULT_ARTIFACT_ROOT=$DEFAULT_ARTIFACT_ROOT
# ENV DEFAULT_ARTIFACT_ROOT="/opt/artifact"
EXPOSE 5000
CMD mlflow server --host 0.0.0.0 --port 5000 --backend-store-uri $BACKEND_STORE_URI --default-artifact-root $DEFAULT_ARTIFACT_ROOT

