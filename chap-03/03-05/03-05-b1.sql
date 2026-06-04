create view
  misc.notas as
select
  id,
  pontuacao,
  case
    when pontuacao >= 80 then 'A'
    when pontuacao >= 60 then 'B'
    when pontuacao >= 40 then 'C'
    else 'F'
  end as nota
from
  misc.lancamentos;