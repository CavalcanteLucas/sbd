select t_o.nome_empresa
from
    empregado.trabalha as t_o
group by
    t_o.nome_empresa
having
    count(t_o.id) >= all(
        select count(t_i.id)
        from
            empregado.trabalha as t_i
        group by
            t_i.nome_empresa
    )
