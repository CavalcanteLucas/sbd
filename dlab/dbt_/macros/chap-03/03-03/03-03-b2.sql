{% macro m03_03_b2() %} -- passar: veja 03-03-b3.sql
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
        'm03_03_a2'
    ) }}
{% endmacro %}


