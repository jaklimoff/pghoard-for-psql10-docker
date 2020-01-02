FROM postgres:10.4-alpine

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


COPY pghoard.sh /
COPY PG_VERSION /var/lib/postgresql/data/PG_VERSION

RUN mkdir /var/lib/pghoard/
RUN mv /usr/local/bin/pg_receivewal /usr/bin/pg_receivewal


CMD /pghoard.sh
