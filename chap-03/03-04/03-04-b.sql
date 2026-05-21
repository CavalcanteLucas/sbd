delete from seguro.carro ca
where ca.ano = '2010' and ca.renavam in (
  select po.renavam
  from seguro.possui po
  where po.id_motorista = '12345'
);