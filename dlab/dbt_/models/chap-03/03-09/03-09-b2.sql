select
    gado.id,
    gado.nome_empregado,
    gado.rua,
    gado.cidade
from
    empregado.empregado as gado
where
    exists (
        select 1
        from
            empregado.trabalha as t
        where
            gado.id = t.id
            and lower(t.nome_empresa) like '%first bank%'
            and t.salario > 10000
    )
