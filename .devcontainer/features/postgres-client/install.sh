#!/usr/bin/env bash
set -e

apt-get update -y && apt-get -y install --no-install-recommends libpq-dev postgresql-client

rm -rf /var/lib/apt/lists/*
