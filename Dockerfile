FROM postgres:10.4-alpine

RUN apk update

RUN apk add --no-cache \
    bash \
    build-base \
    python3 \
    python3-dev \
    ca-certificates \
    postgresql-dev \
    libffi-dev \
    snappy-dev
RUN pip3 install boto azure pghoard

RUN \
  apk add bash py-pip && \
  apk add --virtual=build gcc libffi-dev musl-dev openssl-dev python-dev make && \
  pip --no-cache-dir install -U pip && \
  pip --no-cache-dir install azure-cli 

COPY backup_to_azure.sh /
COPY pghoard.sh /
COPY PG_VERSION /var/lib/postgresql/data/PG_VERSION

RUN mkdir /var/lib/pghoard/
RUN mv /usr/local/bin/pg_receivewal /usr/bin/pg_receivewal


CMD /pghoard.sh
