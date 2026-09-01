"""
  Nota: de acordo com a questão 03-09-e, uma empresa pode estar localizada
  em várias cidades.
  Por isso, não é possível criar uma restrição de chave
  primária em 'empresa' pelo atributo 'nome_empresa'. 
  Sendo assim, não é possível criar uma restrição de chave estrangeira
  em 'trabalha' sem alterar a assinatura do esquema para incluir uma
  coluna adicional contendo 'cidade'.
"""

drop schema if exists empregado cascade;

create schema empregado;

create table
    if not exists empregado.empregado (
        id varchar(10) primary key,
        nome_empregado varchar(20),
        rua varchar(20),
        cidade varchar(20)
    );

create table
    if not exists empregado.empresa (nome_empresa varchar(30), cidade varchar(20));

create table
    if not exists empregado.trabalha (
        id varchar(10) primary key,
        nome_empresa varchar(30),
        salario decimal(8, 2),
        foreign key (id) references empregado.empregado (id)
    );

-- drop table empregado.gerencia;
create table
    if not exists empregado.gerencia (
        id varchar(10),
        id_gerente varchar(10),
        primary key (id, id_gerente),
        foreign key (id) references empregado.empregado (id),
        foreign key (id_gerente) references empregado.empregado (id)
    );

-- delete from empregado.empregado;
insert into
    empregado.empregado
values
    ('12337', 'Lucas', 'Rua Suica', 'Caruaru'),
    ('12338', 'Pedro', 'Rua China', 'Caruaru'),
    ('20001', 'Naruto', 'Rua Franca', 'Caruaru'),
    ('20002', 'Boruto', 'Rua Franca', 'Caruaru'),
    ('20003', 'Jose', 'Rua Cima', 'Belo Jardimu'),
    ('12339', 'Hinata', 'Rua Cima', 'Belo Jardimu'),
    ('12341', 'Joao', 'Rua Holanda', 'Caruaru'),
    ('12342', 'Maria', 'Rua Baixo', 'Belo Jardim'),
    ('12343', 'Ruth', 'Rua Italia', 'Caruaru'),
    ('12344', 'Carla', 'Rua Esquerda', 'Belo Jardim'),
    ('12345', 'Enzo', 'Rua Direita', 'Belo Jardim'),
    ('12346', 'Ash', 'Rua Suja', 'Recife'),
    ('39991', 'Frodo', 'Rua Suja', 'Recife'),
    ('39992', 'Bilbo', 'Rua Apagada', 'Recife'),
    ('39993', 'Sauron', 'Rua Perigosa', 'Recife'),
    ('39994', 'Legolas', 'Rua Pobre', 'Recife'),
    ('39995', 'Harry', 'Rua Rica', 'Recife'),
    ('12340', 'Julia', 'Rua Certa', 'Recife'),
    ('39996', 'Jorge', 'Rua Errada', 'Caruaru');

select
    *
from
    empregado.empregado;

-- delete from empregado.empresa cascade;
insert into
    empregado.empresa
values
    ('First Bank Corporation', 'Recife'),
    ('First Bank Corporation', 'Belo Jardim'),
    ('First Bank Corporation', 'Caruaru'),
    ('Labcodes', 'Recife'),
    ('Small Bank Corporation', 'Belo Jardim'),
    ('Small Bank Corporation', 'Recife'),
    ('Moura', 'Belo Jardim'),
    ('Patio', 'Caruaru'),
    ('Feira', 'Caruaru'),
    ('Feira', 'Belo Jardim');

select
    *
from
    empregado.empresa;

-- delete from empregado.trabalha cascade;
insert into
    empregado.trabalha
values
    (12346, 'First Bank Corporation', 6000),
    (39991, 'First Bank Corporation', 11200),
    (39992, 'First Bank Corporation', 6300),
    (39993, 'First Bank Corporation', 10400),
    (12343, 'First Bank Corporation', 5000),
    (12345, 'First Bank Corporation', 10000),
    (12337, 'Labcodes', 11000),
    (12339, 'Labcodes', 8000),
    (12341, 'Small Bank Corporation', 10200),
    (12338, 'Small Bank Corporation', 8100),
    (39995, 'Small Bank Corporation', 7200),
    (39996, 'Small Bank Corporation', 9300),
    (12340, 'Moura', 9100),
    (12342, 'Feira', 12000),
    (20001, 'Moura', 6033),
    (20002, 'Feira', 8040),
    (20003, 'Moura', 9050),
    (12344, 'Feira', 10000),
    (39994, 'Patio', 6000);

select
    *
from
    empregado.trabalha;