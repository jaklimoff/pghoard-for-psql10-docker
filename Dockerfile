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


RUN mv /usr/local/bin/pg_receivewal /usr/bin/pg_receivewal
RUN echo 10 > /var/lib/postgresql/data/PG_VERSION
RUN ls /var/lib/postgresql/data

CMD /pghoard.sh
