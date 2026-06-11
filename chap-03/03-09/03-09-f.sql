select
    t.nome_empresa
from
    empregado.trabalha t
group by
    nome_empresa
having
    count(t.id) >= all (
        select
            count(t.id)
        from
            empregado.trabalha t
        group by
            nome_empresa
    );