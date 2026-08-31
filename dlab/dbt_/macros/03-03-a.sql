{% macro m03_03_a() %}
    {% set sql_statement %}
update
    {{ ref('03-03-a1') }}
    set salary = salary * 1.1
where
    dept_name = 'Comp. Sci.';
{% endset %}
    {{ execute_sql(
        sql_statement,
        'm03_03_a'
    ) }}
{% endmacro %}
