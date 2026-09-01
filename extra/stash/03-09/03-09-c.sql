select
    t1.id
from
    empregado.trabalha t1
where
    t1.id not in (
        select
            t2.id
        from
            empregado.trabalha t2
        where
            lower(t2.nome_empresa) like ('%first bank%')
    );