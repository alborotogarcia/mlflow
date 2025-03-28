FROM docker.io/python:3.12.9-slim-bookworm
RUN apt-get update; apt-get install -y build-essential pkg-config libpq-dev sqlite3 default-libmysqlclient-dev;  rm -rf /var/lib/apt/lists/*;
RUN pip3 install --no-cache-dir mlflow[extras]==2.21.2 psycopg2==2.9.10 PyMySQL==1.1.1 mysqlclient==2.2.7 google-cloud-storage==3.1.0 
ARG BACKEND_STORE_URI
ARG DEFAULT_ARTIFACT_ROOT
ENV BACKEND_STORE_URI=$BACKEND_STORE_URI DEFAULT_ARTIFACT_ROOT=$DEFAULT_ARTIFACT_ROOT
# ENV DEFAULT_ARTIFACT_ROOT="/opt/artifact"
EXPOSE 5000
CMD mlflow server --host 0.0.0.0 --port 5000 --backend-store-uri $BACKEND_STORE_URI --default-artifact-root $DEFAULT_ARTIFACT_ROOT

