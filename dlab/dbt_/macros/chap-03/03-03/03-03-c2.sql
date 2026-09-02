{% macro m03_03_c2() %} -- passar: veja 03-03-c3.sql
    {% set sql_statement %}
insert into
  instructor
select
  s.id,
  s.name,
  s.dept_name,
  10000.00 as salary
from
  student s
where
  tot_cred > 100
{% endset %}
    {{ execute_sql(
        sql_statement,
        'm03_03_a2'
    ) }}
{% endmacro %}
