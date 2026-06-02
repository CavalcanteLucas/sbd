-- A
select
  id
from agencia_bancaria.cliente
where id not in (
  select
    id
  from agencia_bancaria.emprestimo e
  join agencia_bancaria.tomador t
    on t.numero_emprestimo = e.numero_emprestimo
)

-- B
select id from agencia_bancaria.cliente
except (
  select id from agencia_bancaria.tomador;
)