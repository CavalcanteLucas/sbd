select
    gado.nome_empregado,
    gado.cidade
from
    empregado.empregado gado,
    empregado.empresa sa,
    empregado.trabalha t
where
    gado.id = t.id
    and t.nome_empresa = sa.nome_empresa
    and lower(t.nome_empresa) like '%first bank%'