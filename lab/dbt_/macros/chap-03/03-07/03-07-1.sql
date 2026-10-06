{% macro m_03_07_1() %}
    {% set sql_statement %}
                
        drop schema if exists c03q07 cascade;

        create schema c03q07;

        create table c03q07.p (a1 varchar(1));

        create table c03q07.r1 (a1 varchar(1));

        create table c03q07.r2 (a1 varchar(1));

        insert into
        c03q07.p
        values
        ('x'),
        ('x'),
        ('y'),
        ('z'),
        ('w');

        insert into
        c03q07.r1
        values
        ('x'),
        ('y'),
        ('y');

        insert into
        c03q07.r2
        values
        ('y'),
        ('z');
    {% endset %}

    {{ execute_sql(sql_statement, 'm_03_07_1') }}
{% endmacro %}


