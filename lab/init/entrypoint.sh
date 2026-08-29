#!/bin/sh
set -e

psql --version
python --version
dbt --version

TARGET="$1"

# step 1: initialize postgresql
exec docker-entrypoint.sh postgres &
until pg_isready -h localhost -U postgres; do
    sleep 1
done

echo "PostgreSQL is ready! asdf TARGET - $TARGET"

# step 2: run dbt commands
cd dbt_
dbt test --target $TARGET
dbt run --target $TARGET

wait