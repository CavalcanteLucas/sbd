select
    nota,
    count(id) as n_count
from
    misc.notas
group by
    nota
