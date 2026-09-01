{% macro execute_sql(
        sql_statement,
        macro_name
    ) %}
    {% if execute %}
        {% do run_query(sql_statement) %}
    {% endif %}
{% endmacro %}
