select
  id
from
  agencia_bancaria.cliente
where
  id not in (
    select
      id
    from
      agencia_bancaria.tomador t
  );