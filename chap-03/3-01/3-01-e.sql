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
