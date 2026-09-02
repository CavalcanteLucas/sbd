select
    e.id,
    e.nome_empregado,
    e.rua,
    e.cidade
from
    empregado.empregado as e
where
    e.id like '12345'
