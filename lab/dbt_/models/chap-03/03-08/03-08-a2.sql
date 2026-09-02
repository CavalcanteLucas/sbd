select id
from
    agencia_bancaria.cliente
except
(
    select id
    from
        agencia_bancaria.tomador
)
