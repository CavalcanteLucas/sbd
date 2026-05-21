select max(takers) from (
  select t.course_id, t.sec_id, count(id) as takers
  from takes t
  where semester = 'Fall' and year = '2017'
  group by course_id, t.sec_id
)
