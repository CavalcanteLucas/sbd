select
    count(
        distinct po.id_motorista
    )
from
    seguro.possui as po,
    seguro.participou as pa,
    seguro.acidente as ac
where
    (
        ac.ano = 2017
        and ac.num_sinistro = pa.num_sinistro
        and pa.renavam = po.renavam
    )
