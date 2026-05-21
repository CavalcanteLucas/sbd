select count(distinct po.id_motorista)
from seguro.possui po
join seguro.participou pa
  on po.renavam = pa.renavam
join seguro.acidente ac
  on ac.num_sinistro = pa.num_sinistro
where ac.ano = 2017;
