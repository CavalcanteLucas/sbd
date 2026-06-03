with
  enrollment (course_id, sec_id, takers) as (
    select
      t.course_id,
      t.sec_id,
      count(id) as takers
    from
      takes as t,
      section as s
    where
      (
        t.semester = 'Fall'
        and t.year = '2017'
        and t.semester = s.semester
        and t.year = s.year
        and t.sec_id = s.sec_id
        and t.course_id = s.course_id
      )
    group by
      t.course_id,
      t.sec_id
  )
select
  e.course_id,
  e.sec_id
from
  enrollment e
where
  takers = (
    select
      max(takers)
    from
      enrollment
  );