#!/usr/bin/env bash

set -e

if [ -n "$TESTING" ]; then
    echo "Not running backup when testing"
    exit 0
fi

pg_dump -h $DATABASE_HOST -U commodities > ~/mainhub.bak

