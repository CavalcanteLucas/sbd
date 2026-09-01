select
    e.id,
    e.nome_empregado,
    e.rua,
    e.cidade
from
    empregado.empregado as e
where
    e.id in (
        select t.id
        from
            empregado.trabalha as t
        where
            lower(t.nome_empresa) like '%first bank%'
            and t.salario > 10000
    )
