select c.id
from
    agencia_bancaria.cliente as c
where
    c.id not in (
        select t.id
        from
            agencia_bancaria.tomador as t
    )
