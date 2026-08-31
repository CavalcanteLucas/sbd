{% macro execute_sql(
        sql_statement,
        macro_name
    ) %}
    {% if execute %}
        {{ log(
            "running " ~ macro_name ~ "...",
            info = True
        ) }}

        {% do run_query(sql_statement) %}
    {% endif %}
{% endmacro %}
