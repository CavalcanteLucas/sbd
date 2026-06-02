drop schema if exists agencia_bancaria cascade;

create schema agencia_bancaria;

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
  endereco_cliente varchar(20),
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

-- drop table agencia_bancaria.tomador
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

-- drop table agencia_bancaria.depositante
create table agencia_bancaria.depositante (
  id varchar(10),
  numero_conta varchar(10),
  primary key (id, numero_conta),
  foreign key (id) references agencia_bancaria.cliente (id),
  foreign key (numero_conta) references agencia_bancaria.conta (numero_conta)
);

-- delete from agencia_bancaria.agencia cascade;
insert into agencia_bancaria.agencia values
  ('A01', 'Caruaru', 100000.00),
  ('A14', 'Caruaru', 200000.00),
  ('A02', 'Recife', 150000.00),
  ('A03', 'Belo Jardim', 125000.00);
-- select * from agencia_bancaria.agencia;

insert into agencia_bancaria.cliente values
  ('12339', 'Lucas', 'Rua Ademar', 'Caruaru'),
  ('12340', 'Pedro', 'Rua Bartolomeu', 'Caruaru'),
  ('12341', 'Jose', 'Rua Caico', 'Recife'),
  ('12342', 'Maria', 'Rua Caico', 'Recife'),
  ('20001', 'Paulo', 'Rua Epaminondas', 'Recife'),
  ('12343', 'Jesus', 'Rua Dorimar', 'Belo Jardim'),
  ('12344', 'Judas', 'Rua Epaminondas', 'Belo Jardim'),
  ('20002', 'Tiago', 'Rua Jarbas', 'Caruaru'),
  ('12345', 'Beto', 'Rua Epaminondas', 'Belo Jardim');
-- select * from agencia_bancaria.cliente;
  
insert into agencia_bancaria.emprestimo values
  ('E01', 'A01', 100.00),
  ('E02', 'A01', 200.00),
  ('E03', 'A02', 150.00),
  ('E04', 'A02', 250.00),
  ('E05', 'A02', 350.00),
  ('E06', 'A03', 401.00),
  ('E07', 'A03', 501.00);
-- select * from agencia_bancaria.emprestimo;

insert into agencia_bancaria.tomador values
  ('12339', 'E01'),
  ('12340', 'E02'),
  ('12339', 'E03'),
  ('12341', 'E04'),
  ('12342', 'E05'),
  ('12339', 'E06'),
  ('12343', 'E07');
-- select * from agencia_bancaria.tomador;

insert into agencia_bancaria.conta values
  ('C01', 'A01', 1000),
  ('C11', 'A14', 1500),
  ('C02', 'A01', 2000),
  ('C03', 'A02', 1001),
  ('C04', 'A01', 2001),
  ('C05', 'A03', 3011),
  ('C06', 'A03', 4112),
  ('C07', 'A03', 5113),
  ('C08', 'A02', 6009),
  ('C22', 'A14', 6500);
-- select * from agencia_bancaria.conta;

insert into agencia_bancaria.depositante values
  ('12339', 'C01'),
  ('12339', 'C11'),
  ('12340', 'C02'),
  ('12341', 'C03'),
  ('12342', 'C04'),
  ('12343', 'C05'),
  ('12344', 'C06'),
  ('12345', 'C07'),
  ('20001', 'C08'),
  ('20001', 'C22');
-- select * from agencia_bancaria.depositante;
