select
    nome_empresa
from
    empregado.trabalha t
group by
    t.nome_empresa
having
    avg(salario) > (
        select
            avg(salario)
        from
            empregado.trabalha t
        where
            lower(t.nome_empresa) like '%first bank%'
        group by
            t.nome_empresa
    );