select
    nota,
    count(id) as n_count
from
    universidade.notas
group by
    nota
