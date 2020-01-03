FROM matsuu/azure-cli-python

RUN apk update
RUN apk add postgresql

COPY backup_to_azure.sh /
