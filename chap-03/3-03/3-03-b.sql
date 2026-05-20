select course_id from course where course_id not in (
  select course_id from section
)

delete from course
where course_id not in (
  select course_id from section
)

select course_id from course where course_id not in (
  select course_id from section
)
