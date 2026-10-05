select
    nota,
    count(id) as n_count
from
    notas
group by
    nota
