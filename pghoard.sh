#!/usr/bin/env bash

set -e

if [ -n "$TESTING" ]; then
    echo "Not running backup when testing"
    exit 0
fi

pghoard --config $PGHOARD_CONFIG