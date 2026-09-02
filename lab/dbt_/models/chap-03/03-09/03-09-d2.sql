select t_o.id
from
    empregado.trabalha as t_o
where
    t_o.salario > all(
        select t_i.salario
        from
            empregado.trabalha as t_i
        where
            lower(t_i.nome_empresa) like '%small bank%'
    )
