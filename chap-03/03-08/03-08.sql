-- 03-08

-- drop table agencia;
-- drop table cliente;
-- drop table emprestimo;
-- drop table tomador;
-- drop table depositante;
  
drop schema if exists agencia_bancaria cascade;

create schema agencia_bancaria

-- drop table agencia_bancaria.agencia cascade;
create table agencia_bancaria.agencia (
  nome_agencia varchar(10) primary key,
  cidade_agencia varchar(20),
  ativos decimal (10,2) not null
);

-- drop table agencia_bancaria.cliente cascade;
create table agencia_bancaria.cliente (
  id varchar(10) primary key,
  nome_cliente varchar(10) not null,
  endereco_cliente varchar(10),
  cidade_cliente varchar(20)
);

-- drop table agencia_bancaria.emprestimo
create table agencia_bancaria.emprestimo (
  numero_emprestimo varchar(10) unique,
  nome_agencia varchar(10),
  valor decimal(10,2) not null,
  primary key (numero_emprestimo, nome_agencia),
  foreign key (nome_agencia) references agencia_bancaria.agencia (nome_agencia)
);

create table agencia_bancaria.tomador (
  id varchar(10),
  numero_emprestimo varchar(10),
  primary key (id, numero_emprestimo),
  foreign key (id) references agencia_bancaria.cliente (id),
  foreign key (numero_emprestimo) references agencia_bancaria.emprestimo (numero_emprestimo)
);

-- drop table agencia_bancaria.conta
create table agencia_bancaria.conta (
  numero_conta varchar(10) unique,
  nome_agencia varchar(10),
  saldo decimal(10,2) not null,
  primary key (numero_conta, nome_agencia),
  foreign key (nome_agencia) references agencia_bancaria.agencia (nome_agencia)
);

create table agencia_bancaria.depositante (
  id varchar(10),
  numero_conta varchar(10),
  primary key (id, numero_conta),
  foreign key (id) references agencia_bancaria.cliente (id),
  foreign key (numero_conta) references agencia_bancaria.conta (numero_conta)
);

delete from agencia_bancaria.agencia;
insert into agencia_bancaria.agencia values
  ('A01', 'caruaru', 100000.00),
  ('A02', 'recife', 150000.00),
  ('A03', 'belo jardim', 125000.00);
select * from agencia_bancaria.agencia;

insert into agencia_bancaria.cliente values
  ('P01', 'lucas', 'rua A', 'caruaru'),
  ('P02', 'pedro', 'rua B', 'caruaru'),
  ('P03', 'jose', 'rua C', 'belo jardim'),
  ('P04', 'maria', 'rua C', 'belo jardim'),
  ('P05', 'jesus', 'rua D', 'galileia');
select * from agencia_bancaria.cliente;
  
insert into agencia_bancaria.emprestimo values
  ('E01', 'A01', 100),
  ('E02', 'A01', 200),
  ('E03', 'A02', 150),
  ('E04', 'A02', 250),
  ('E05', 'A02', 350),
  ('E06', 'A03', 401),
  ('E07', 'A03', 501);
select * from agencia_bancaria.emprestimo;

insert into agencia_bancaria.tomador values
  ('P01', 'E01'),
  ('P02', 'E02'),
  ('P01', 'E03'),
  ('P03', 'E04'),
  ('P04', 'E05'),
  ('P01', 'E06'),
  ('P05', 'E07');
select * from agencia_bancaria.tomador;

insert into agencia_bancaria.conta values
  ('C01', 'A01', 1000),
  ('C02', 'A01', 2000),
  ('C03', 'A02', 1001),
  ('C04', 'A01', 2001),
  ('C05', 'A03', 3011);
select * from agencia_bancaria.conta;

insert into agencia_bancaria.depositante values
  ('P01', 'C01'),
  ('P02', 'C02'),
  ('P03', 'C03'),
  ('P04', 'C04'),
  ('P05', 'C05');
select * from agencia_bancaria.depositante;
