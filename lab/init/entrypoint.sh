#!/bin/sh
set -e

target="$1"

psql --version
python --version
dbt --version

exec docker-entrypoint.sh postgres &
until pg_isready -h localhost -U postgres; do
    sleep 1
done

cd dbt_

chmod +x dbt.sh
./dbt.sh $target

wait