#!/bin/bash
set -e

DB_USER="${POSTGRES_USER:-postgres}"
DB_PASSWORD="${POSTGRES_PASSWORD:-postgres}"
DB_NAME="${POSTGRES_DB:-$DB_USER}"

if [ ! -s "$PGDATA/PG_VERSION" ]; then
    initdb -D "$PGDATA" \
        --username="$DB_USER" \
        --encoding=UTF8 \
        --locale=en_US.UTF-8

    echo "host all all 0.0.0.0/0 scram-sha-256" >> "$PGDATA/pg_hba.conf"
    echo "listen_addresses = '*'" >> "$PGDATA/postgresql.conf"

    pg_ctl -D "$PGDATA" -o "-c listen_addresses=''" -w start

    psql -U "$DB_USER" -d postgres -c "ALTER USER \"$DB_USER\" PASSWORD '$DB_PASSWORD';"
    psql -U "$DB_USER" -d postgres -c "CREATE DATABASE \"$DB_NAME\";"

    pg_ctl -D "$PGDATA" -m fast -w stop
fi

exec "$@" -D "$PGDATA"
