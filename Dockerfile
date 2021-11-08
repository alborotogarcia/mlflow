FROM docker.io/python:3.9.7-slim-bullseye
RUN apt-get update; apt-get install -y build-essential libpq-dev=13.4-0+deb11u1 sqlite3 default-libmysqlclient-dev;  rm -rf /var/lib/apt/lists/*;
RUN pip3 install --no-cache-dir mlflow[extras]==1.21.0 psycopg2==2.9.1 PyMySQL==1.0.2 mysqlclient==2.0.3
ARG BACKEND_STORE_URI
ARG DEFAULT_ARTIFACT_ROOT
ENV BACKEND_STORE_URI=$BACKEND_STORE_URI DEFAULT_ARTIFACT_ROOT=$DEFAULT_ARTIFACT_ROOT
# ENV DEFAULT_ARTIFACT_ROOT="/opt/artifact"
EXPOSE 5000
CMD mlflow server --host 0.0.0.0 --port 5000 --backend-store-uri $BACKEND_STORE_URI --default-artifact-root $DEFAULT_ARTIFACT_ROOT

