-- Banco de dados de seguro (Figura 3.17)

drop schema if exists seguro cascade;
create schema seguro;

create table seguro.pessoa();
alter table seguro.pessoa
  add column id_motorista varchar(10),
  add column nome varchar(10),
  add column endereco varchar(10);
alter table seguro.pessoa
  add constraint pessoa_pk primary key (id_motorista);

create table seguro.carro();
alter table seguro.carro
  add column renavam varchar(10),
  add column modelo varchar(10),
  add column ano varchar(4);
alter table seguro.carro
  add constraint carro_pk primary key (renavam);

create table seguro.acidente();
alter table seguro.acidente
  add column num_sinistro varchar(10),
  add column ano int,
  add column local varchar(10);
alter table seguro.acidente
  add constraint acidente_pk primary key (num_sinistro);

create table seguro.possui();
alter table seguro.possui
  add column id_motorista varchar(10),
  add column renavam varchar(10);
alter table seguro.possui
  add constraint possui_pk primary key (id_motorista, renavam);
alter table seguro.possui
  add constraint carro_fk foreign key (renavam)
  references seguro.carro (renavam)
  on delete cascade;
alter table seguro.possui
  add constraint pessoa_fk foreign key (id_motorista)
  references seguro.pessoa (id_motorista)
  on delete cascade;

create table seguro.participou();
alter table seguro.participou
  add column num_sinistro varchar(10),
  add column renavam varchar(10),
  add column id_motorista varchar(10),
  add column valor_dano decimal(6,2);
alter table seguro.participou
  add constraint participou_pk primary key (num_sinistro, renavam);
alter table seguro.participou
  add constraint pessoa_fk foreign key (id_motorista)
  references seguro.pessoa (id_motorista)
  on delete cascade;
alter table seguro.participou
  add constraint carro_fk foreign key (renavam)
  references seguro.carro (renavam)
  on delete cascade;

delete from seguro.pessoa cascade;
select * from seguro.pessoa;
insert into seguro.pessoa (id_motorista, nome, endereco) values
('11111', 'Lucas', 'Rua A'),
('11112', 'Maria', 'Rua B'),
('11113', 'Carla', 'Rua C'),
('12345', 'Pedro', 'Rua D'),
('22222', 'Pedro', 'Rua E');

delete from seguro.carro cascade;
select * from seguro.carro;
insert into seguro.carro (renavam, modelo, ano) values
('R001', 'Civic', '2009'),
('R002', 'Onix',  '2010'),
('R003', 'Palio', '2011'),
('R004', 'Corsa', '2010');

delete from seguro.acidente cascade;
select * from seguro.acidente;
insert into seguro.acidente (num_sinistro, ano, local) values
('S001', 2016, 'Centro'),
('S002', 2016, 'BairroA'),
('S003', 2017, 'Centro'),
('S004', 2017, 'Centro');

delete from seguro.possui cascade;
select * from seguro.possui;
insert into seguro.possui (id_motorista, renavam) values
('11111', 'R001'),
('11111', 'R002'),
('11113', 'R003'),
('12345', 'R004');

delete from seguro.participou cascade;
select * from seguro.participou;
insert into seguro.participou (num_sinistro, renavam, id_motorista, valor_dano) values
('S001', 'R001', '11111', 1500.00),
('S001', 'R002', '11112', 2200.00),
('S002', 'R003', '11113', 5000.00),
('S003', 'R001', '11111', 300.00),
('S003', 'R002', '22222', 950.00),
('S004', 'R003', '11111', 300.00),
('S004', 'R004', '12345', 950.00);
