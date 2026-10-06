"""
  Nota: Este macro depende do macro m_03_09_0.
"""

{% macro m_03_10_0() %}
    {% set sql_statement %}

        truncate table empregado.gerencia;
    
        insert into
        empregado.gerencia
        values
        (12344, 12342),
        (20002, 12342),
        (39993, 39991),
        (12345, 39991),
        (39992, 39993),
        (12346, 12345),
        (12343, 12345),
        (12339, 12337),
        (20001, 12340),
        (20001, 20003),
        (39995, 12341),
        (39996, 12341),
        (12338, 12341);

    {% endset %}

    {{ execute_sql(sql_statement, 'm_03_10_0') }}
{% endmacro %}
