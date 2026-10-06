{% macro m_03_03_c2() %} -- passar: deve falhar!
    {% set sql_statement %}
insert into
  universidade.instructor
select
  s.id,
  s.name,
  s.dept_name,
  10000.00 as salary
from
  universidade.student s
where
  s.tot_cred > 100
{% endset %}
    {{ execute_sql(
        sql_statement,
        'm_03_03_c2'
    ) }}
{% endmacro %}
