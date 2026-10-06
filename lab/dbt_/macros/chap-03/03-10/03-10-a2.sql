{% macro m_03_10_a2() %}
    {% set sql_statement %}

    update empregado.empregado
    set
        cidade = 'Newtown'
    where
        id = '12345'

    {% endset %}

    {{ execute_sql(sql_statement, 'm_03_10_a2') }}
{% endmacro %}
