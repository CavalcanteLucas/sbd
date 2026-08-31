select
  max(takers)
from
  (
    select
      t.course_id,
      t.sec_id,
      count(id) as takers
    from
      takes t
    where
      (
        t.semester = 'Fall'
        and t.year = '2017'
      )
    group by
      t.course_id,
      t.sec_id
  );