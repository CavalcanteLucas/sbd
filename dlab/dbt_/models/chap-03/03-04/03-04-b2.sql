select
    *
from
    seguro.carro as ca
where
    not (
        ca.ano = '2010'
        and ca.renavam in (
            select po.renavam
            from
                seguro.possui as po
            where
                po.id_motorista = '12345'
        )
    )
