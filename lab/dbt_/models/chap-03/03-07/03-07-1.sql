drop table if exists misc.p;

drop table if exists misc.r1;

drop table if exists misc.r2;

create table
if not exists misc.p (a1 varchar(1));

create table
if not exists misc.r1 (a1 varchar(1));

create table
if not exists misc.r2 (a1 varchar(1));

insert into
misc.p
values
('x'),
('x'),
('y'),
('z'),
('w');

insert into
misc.r1
values
('x'),
('y'),
('y');

insert into
misc.r2
values
('y'),
('z');
