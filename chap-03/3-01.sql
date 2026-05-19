-- a OK
select title
from course
where credits=3;

-- b OK
select distinct s.id
from student s
join takes t on s.id = t.id
join teaches tt on t.course_id = tt.course_id
join instructor i on tt.id = i.id
where i.name = 'Einstein'
  
-- c OK
select max(salary)
from instructor

-- d OK
select id, name, salary
from instructor
where salary = (
  select max(salary)
  from instructor
)

-- e OK
select t.course_id, t.sec_id, count(id) as takers
from takes t
where semester = 'Fall' and year = '2017'
group by course_id, t.sec_id
order by takers desc
  
select s.course_id, s.sec_id,
  (select count(*)
   from takes t
   where t.course_id = s.course_id
    and t.semester = s.semester
    and t.year = s.year
    and t.sec_id = s.sec_id)
  as takers
from section s
where semester = 'Fall' and year = '2017'
 
-- f OK
select max(takers) from (
  select t.course_id, t.sec_id, count(id) as takers
  from takes t
  where semester = 'Fall' and year = '2017'
  group by course_id, t.sec_id
)
  
-- g OK
with enrollment(course_id, sec_id, takers) as (
  select t.course_id, t.sec_id, count(id) as takers
  from takes t
  where semester = 'Fall' and year = '2017'
  group by course_id, t.sec_id
)
select e.course_id, e.sec_id
from enrollment e
where takers = (select max(takers) from enrollment)
