select c.course_id
from
    course as c
where
    (
        c.course_id not in (
            select s.course_id
            from
                section as s
        )
    )
