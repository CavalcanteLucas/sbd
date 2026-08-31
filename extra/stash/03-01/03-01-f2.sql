select
  max(takers)
from
  (
    select
      t.course_id,
      t.sec_id,
      count(id) as takers
    from
      takes t, section s
    where
      (
        t.semester = 'Fall'
        and t.year = '2017'
        and t.sec_id = s.sec_id
        and t.semester = s.semester
        and t.year = s.year
        and t.course_id = s.course_id
      )
    group by
      t.course_id,
      t.sec_id
  );