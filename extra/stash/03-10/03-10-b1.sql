select distinct
    g.id_gerente,
    t.salario
from
    empregado.gerencia g,
    empregado.trabalha t
where
    g.id_gerente = t.id
    and lower(t.nome_empresa) like '%first bank%';