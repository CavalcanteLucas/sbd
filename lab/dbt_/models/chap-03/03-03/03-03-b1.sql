select c.course_id
from
    universidade.course as c
where
    (
        c.course_id not in (
            select s.course_id
            from
                universidade.section as s
        )
    )
