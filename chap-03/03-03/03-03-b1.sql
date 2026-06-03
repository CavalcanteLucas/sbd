select
  course_id
from
  course
where
  (
    course_id not in (
      select
        course_id
      from
        section
    )
  );