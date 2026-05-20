with enrollment(course_id, sec_id, takers) as (
  select t.course_id, t.sec_id, count(id) as takers
  from takes t
  where semester = 'Fall' and year = '2017'
  group by course_id, t.sec_id
)
select e.course_id, e.sec_id
from enrollment e
where takers = (select max(takers) from enrollment)
