{% macro m03_03_a2() %}
    {% set sql_statement %}
update
    instructor
    set salary = salary * 1.1
where
    dept_name = 'Comp. Sci.';
{% endset %}
    {{ execute_sql(
        sql_statement,
        'm03_03_a2'
    ) }}
{% endmacro %}
