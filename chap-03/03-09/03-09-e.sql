select distinct
    (nome_empresa)
from
    empregado.empresa sa
where
    sa.cidade in (
        select
            sa.cidade
        from
            empregado.empresa sa
        where
            lower(sa.nome_empresa) like '%small bank%'
    )
    and lower(sa.nome_empresa) not like '%small bank%';