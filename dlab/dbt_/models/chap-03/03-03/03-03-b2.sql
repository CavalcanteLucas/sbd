select *
from
    {{ ref('03-03-b1') }}
where
    course_id in (
        select course_id
        from
            section
    )
