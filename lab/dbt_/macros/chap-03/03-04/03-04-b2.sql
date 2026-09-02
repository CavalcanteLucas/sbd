{% macro m_03_04_b2() %}
{% set sql_statement %}
delete from seguro.carro ca
where
  ca.ano = '2010'
  and ca.renavam in (
    select
      po.renavam
    from
      seguro.possui po
    where
      po.id_motorista = '12345'
  );
{% endset %}

{{ execute_sql(sql_statement, 'm_03_04_b2') }}

{% endmacro %}