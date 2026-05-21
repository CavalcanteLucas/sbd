create view misc.notas as
select
  id,
  pontuacao,
  case
    when pontuacao > 80 then 'A'
    when pontuacao between 60 and 80 then 'B'
    when pontuacao between 40 and 60 then 'C'
    else 'F'
  end as nota
from misc.lancamentos

select * from misc.notas