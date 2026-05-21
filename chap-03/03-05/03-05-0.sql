drop schema misc cascade;

create schema misc;

create table misc.lancamentos(
  id varchar(10),
  pontuacao integer
);

insert into misc.lancamentos (id, pontuacao) values
('111',100),
('112',3),
('113',57),
('114',89),
('115',12),
('116',76),
('117',45),
('118',98),
('119',24),
('120',67),
('121',39),
('122',81),
('123',5),
('124',93),
('125',54),
('126',18),
('127',72),
('128',31),
('129',86),
('130',60),
('131',0),
('132',49);