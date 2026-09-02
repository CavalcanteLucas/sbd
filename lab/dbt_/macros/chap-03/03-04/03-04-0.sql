{% macro m_03_04_0() %}
    {% set sql_statement %}

create schema seguro

create table seguro.pessoa (
    id_motorista varchar(10) primary key,
    nome varchar(10),
    endereco varchar(10)
)

create table seguro.carro (
    renavam varchar(10) primary key,
    modelo varchar(10),
    ano varchar(4)
)

create table seguro.acidente (
    num_sinistro varchar(10) primary key,
    ano int,
    local varchar(10)
)

create table seguro.possui (
    id_motorista varchar(10),
    renavam varchar(10),
    primary key (id_motorista, renavam),
    foreign key (renavam) references seguro.carro(renavam) on delete cascade,
    foreign key (id_motorista) references seguro.pessoa(id_motorista) on delete cascade
)

create table seguro.participou (
    num_sinistro varchar(10),
    renavam varchar(10),
    id_motorista varchar(10),
    valor_dano decimal(6, 2),
    primary key (id_motorista, renavam),
    foreign key (renavam) references seguro.carro(renavam) on delete cascade,
    foreign key (id_motorista) references seguro.pessoa(id_motorista) on delete cascade
);

insert into seguro.pessoa (id_motorista, nome, endereco) values
('11111', 'Lucas', 'Rua A'),
('11112', 'Maria', 'Rua B'),
('11113', 'Carla', 'Rua C'),
('12345', 'Pedro', 'Rua D'),
('22222', 'Pedro', 'Rua E');

insert into seguro.carro (renavam, modelo, ano) values
('R001', 'Civic', '2009'),
('R002', 'Onix', '2010'),
('R003', 'Palio', '2011'),
('R004', 'Corsa', '2010');

insert into seguro.acidente (num_sinistro, ano, local) values
('S001', 2016, 'Centro'),
('S002', 2016, 'BairroA'),
('S003', 2017, 'Centro'),
('S004', 2017, 'Centro');

insert into seguro.possui (id_motorista, renavam) values
('11111', 'R001'),
('11111', 'R002'),
('11113', 'R003'),
('12345', 'R004');

insert into seguro.participou (num_sinistro, renavam, id_motorista, valor_dano) values
('S001', 'R001', '11111', 1500.00),
('S001', 'R002', '11112', 2200.00),
('S002', 'R003', '11113', 5000.00),
('S003', 'R001', '12345', 300.00),
('S003', 'R002', '22222', 950.00),
('S004', 'R003', '11111', 300.00),
('S004', 'R004', '12345', 950.00);

    {% endset %}

    {{ execute_sql(sql_statement, 'm_03_04_0') }}
{% endmacro %}