update empregado.trabalha
set
    salario = case
        when salario * 1.1 > 10000 then salario * 1.03
        else salario * 1.1
    end
where
    lower(nome_empresa) like '%first bank%'
    and id in (
        select distinct
            id_gerente
        from
            empregado.gerencia
    );