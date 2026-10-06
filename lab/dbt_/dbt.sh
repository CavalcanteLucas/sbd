#!/bin/sh
set -e

target="$1"

# dbt test --target $target

dbt_run() {
    local item="$1"
    dbt run --select $item --target $target --full-refresh --profiles-dir /dbt_ # --debug
}

dbt_exec() {
    local item="$1"
    dbt run-operation $item --target $target --profiles-dir /dbt_ # --debug
}


build_03() {

    build_03_01() {
        dbt_run "chap-03.03-01"
    }

    build_03_02() {
        dbt_exec "m_03_02_0"
        dbt_run "chap-03.03-02"
    }

    build_03_03() {
        dbt_run "chap-03.03-03.03-03-a1"
        dbt_exec "m_03_03_a2"
        dbt_run "chap-03.03-03.03-03-a3
                 chap-03.03-03.03-03-b1"
        dbt_exec "m_03_03_b2"
        dbt_run "chap-03.03-03.03-03-b3
                 chap-03.03-03.03-03-c1"
        # dbt_exec "m_03_03_c2" -- pular este caso: deve falhar!
        dbt_run "chap-03.03-03.03-03-c3"
    }

    build_03_04() {
        dbt_exec "m_03_04_0"
        dbt_run "chap-03.03-04.03-04-a
                chap-03.03-04.03-04-b1-i
                chap-03.03-04.03-04-b1-ii
                chap-03.03-04.03-04-b1-iii"
        dbt_exec "m_03_04_b2"
        dbt_run "chap-03.03-04.03-04-b3-i
                chap-03.03-04.03-04-b3-ii
                chap-03.03-04.03-04-b3-iii"
    }

    build_03_05() {
        dbt_exec "m_03_05_0"
        dbt_run "chap-03.03-05.03-05-a"
        dbt_exec "m_03_05_b1"
        dbt_run "chap-03.03-05.03-05-b2"
    }

    build_03_06() {
        dbt_run "chap-03.03-06.03-06"
    }

    build_03_07() {
        dbt_exec "m_03_07_1"
        dbt_run "chap-03.03-07.03-07-2"
        dbt_exec "m_03_07_3"
        dbt_run "chap-03.03-07.03-07-4"
    }

    build_03_08() {
        dbt_exec "m_03_08_0"
        dbt_run "chap-03.03-08.03-08-a1
                chap-03.03-08.03-08-a2
                chap-03.03-08.03-08-b
                chap-03.03-08.03-08-c"
    }

    build_03_09() {
        dbt_exec "m_03_09_0"
        dbt_run "chap-03.03-09.03-09-a
                chap-03.03-09.03-09-b1
                chap-03.03-09.03-09-b2
                chap-03.03-09.03-09-c
                chap-03.03-09.03-09-d1
                chap-03.03-09.03-09-d2
                chap-03.03-09.03-09-e
                chap-03.03-09.03-09-f
                chap-03.03-09.03-09-g"
    }

    # build_03_01
    # build_03_02
    # build_03_03
    # build_03_04
    # build_03_05
    # build_03_06
    # build_03_07
    # build_03_08
    build_03_09
}


build_03



echo "Done!"