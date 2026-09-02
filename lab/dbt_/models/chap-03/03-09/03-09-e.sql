select distinct sa_o.nome_empresa
from
    empregado.empresa as sa_o
where
    sa_o.cidade in (
        select sa_i.cidade
        from
            empregado.empresa as sa_i
        where
            lower(sa_i.nome_empresa) like '%small bank%'
    )
    and lower(sa_o.nome_empresa) not like '%small bank%'
