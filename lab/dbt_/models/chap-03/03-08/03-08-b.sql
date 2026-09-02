select c2.nome_cliente
from
    agencia_bancaria.cliente as c1,
    agencia_bancaria.cliente as c2
where
    (
        c1.id = '12345'
        and c1.cidade_cliente = c2.cidade_cliente
        and c1.endereco_cliente = c2.endereco_cliente
    )
