{% macro m_03_07_3() %}
    {% set sql_statement %}
                
        delete from c03q07.r2;

    {% endset %}

    {{ execute_sql(sql_statement, 'm_03_07_3') }}
{% endmacro %}


