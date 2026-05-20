drop table if exists nota_pontos;
  
create table if not exists nota_pontos (
  grade varchar(2) primary key,
  points decimal(3,2)
);

insert into nota_pontos (grade, points) values
  ('A', 4.0),
  ('A-', 3.7),
  ('B+', 3.3),
  ('B', 3.0),
  ('B-', 2.7),
  ('C+', 2.3),
  ('C', 2.0),
  ('C-', 1.7),
  ('D', 1.3),
  ('D-', 1.0),
  ('E', 0.7),
  ('E-', 0.3),
  ('F', 0.0);

select * from nota_pontos
