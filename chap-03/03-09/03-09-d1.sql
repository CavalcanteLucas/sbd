select
    t.id
from
    empregado.trabalha t
where
    t.salario > (
        select
            max(t.salario)
        from
            empregado.trabalha t
        where
            lower(t.nome_empresa) like '%small bank%'
    );