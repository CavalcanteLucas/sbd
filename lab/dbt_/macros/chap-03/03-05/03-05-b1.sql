{% macro m_03_05_b1() %}
    {% set sql_statement %}
        create or replace view universidade.notas as (

        select
            id,
            pontuacao,
            case
                when pontuacao >= 80 then 'A'
                when pontuacao >= 60 then 'B'
                when pontuacao >= 40 then 'C'
                else 'F'
            end as nota
        from
            universidade.lancamentos
        );

    {% endset %}

    {{ execute_sql(sql_statement, 'm_03_05_b1') }}
{% endmacro %}



