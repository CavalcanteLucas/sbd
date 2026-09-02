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


# chap-03

## 03-01 

# dbt_run "chap-03.03-01"

## 03-02

# dbt_exec "m_03_02_0"
# dbt_run "chap-03.03-02"

## 03-03

# dbt_run "chap-03.03-03.03-03-a1"
# dbt_exec "m_03_03_a2"
# dbt_run "chap-03.03-03.03-03-a3"
# dbt_run "chap-03.03-03.03-03-b1"
# dbt_exec "m_03_03_b2"
# dbt_run "chap-03.03-03.03-03-b3"
# dbt_run "chap-03.03-03.03-03-c1"
# # dbt_exec "m_03_03_c2" -- passar: deve falhar!
# dbt_run "chap-03.03-03.03-03-c3"

## 03-04

# dbt_exec "m_03_04_0"
# dbt_run "chap-03.03-04.03-04-a
#          chap-03.03-04.03-04-b1-i
#          chap-03.03-04.03-04-b1-ii
#          chap-03.03-04.03-04-b1-iii"
# dbt_exec "m_03_04_b2"
# dbt_run "chap-03.03-04.03-04-b3-i
#          chap-03.03-04.03-04-b3-ii
#          chap-03.03-04.03-04-b3-iii"

## 03-05


echo "Done!"