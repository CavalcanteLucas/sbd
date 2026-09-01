select t_o.nome_empresa
from
    empregado.trabalha as t_o
group by
    t_o.nome_empresa
having
    avg(t_o.salario) > (
        select avg(t_i.salario)
        from
            empregado.trabalha as t_i
        where
            lower(t_i.nome_empresa) like '%first bank%'
        group by
            t_i.nome_empresa
    )
