select
    gado.nome_empregado,
    gado.cidade
from
    empregado.empregado as gado,
    empregado.empresa as sa,
    empregado.trabalha as t
where
    gado.id = t.id
    and t.nome_empresa = sa.nome_empresa
    and lower(t.nome_empresa) like '%first bank%'
