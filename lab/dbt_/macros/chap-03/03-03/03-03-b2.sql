{% macro m_03_03_b2() %}
    {% set sql_statement %}
delete from course
where
  course_id not in (
    select
      course_id
    from
      section
  )
{% endset %}
    {{ execute_sql(
        sql_statement,
        'm_03_03_a2'
    ) }}
{% endmacro %}


