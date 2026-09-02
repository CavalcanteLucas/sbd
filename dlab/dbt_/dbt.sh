#!/bin/sh
set -e

target="$1"

# dbt test --target $target

dbt_run() {
    local item="$1"
    dbt run --select $item --target $target --full-refresh --profiles-dir /dbt_ --debug
}

dbt_exec() {
    local item="$1"
    dbt run-operation $item --target $target --profiles-dir /dbt_ --debug
}



# dbt_run "chap-03.03-01"

dbt_run "chap-03.03-03.03-03-c4"
# dbt_exec "m03_03_c2"


# dbt_run "chap-03.03-01"

# dbt_run "chap-03.03-02"

# dbt_run "chap-03.03-03"
echo "Done!"