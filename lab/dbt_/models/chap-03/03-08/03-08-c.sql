select distinct a.nome_agencia
from
    agencia_bancaria.agencia as a,
    agencia_bancaria.conta as co,
    agencia_bancaria.depositante as d,
    agencia_bancaria.cliente as cl
where
    (
        a.nome_agencia = co.nome_agencia
        and co.numero_conta = d.numero_conta
        and d.id = cl.id
        and lower(cl.cidade_cliente) like 'caruaru'
    )
