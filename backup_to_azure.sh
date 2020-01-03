#!/usr/bin/env bash

set -e

if [ -n "$TESTING" ]; then
    echo "Not running backup when testing"
    exit 0
fi

echo "Start backing up...."

# shellcheck disable=SC2155
export DATE=`date +%d-%m-%y_%H:%M`

cd ~

pg_dump -h $PGHOST -U commodities > backup.bak
az storage blob upload -f backup.bak \
                       --account-name $AZURE_ACCOUNT_NAME \
                       --account-key $AZURE_ACCOUNT_KEY \
                       -c $AZURE_CONTAINER_NAME \
                       -n db-${DATE}.bak

echo "Backup - $AZURE_CONTAINER_NAME ->> db-${DATE}.bak"