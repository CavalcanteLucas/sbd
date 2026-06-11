select
    gado.id,
    gado.nome_empregado,
    gado.rua,
    gado.cidade
from
    empregado.empregado gado
where
    id in (
        select
            id
        from
            empregado.trabalha t
        where
            lower(t.nome_empresa) like '%first bank%'
            and t.salario > 10000
    );