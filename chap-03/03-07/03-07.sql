drop table if exists misc.p;
drop table if exists misc.r1;
drop table if exists misc.r2;

create table if not exists misc.p(
  a1 integer
);

create table if not exists misc.r1(
  a1 integer
);

create table if not exists misc.r2(
  a1 integer
);

insert into misc.p values
  (1),
  (2),
  (3),
  (4);

insert into misc.r1 values
  (1),
  (2);

SELECT misc.p.a1
FROM misc.p, misc.r1, misc.r2
WHERE misc.p.a1 = misc.r1.a1 OR misc.p.a1 = misc.r2.a1;

insert into misc.r2 values
  (2),
  (3);

SELECT misc.p.a1
FROM misc.p, misc.r1, misc.r2
WHERE misc.p.a1 = misc.r1.a1 OR misc.p.a1 = misc.r2.a1;
