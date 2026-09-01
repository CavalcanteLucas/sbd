select
    t.id
from
    empregado.trabalha t
where
    t.salario > all(
        select
            t.salario
        from
            empregado.trabalha t
        where
            lower(t.nome_empresa) like '%small bank%'
    );