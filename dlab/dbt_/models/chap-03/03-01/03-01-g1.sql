with enrollment (
    course_id,
    sec_id,
    takers
) as (
    select
        t.course_id,
        t.sec_id,
        count(t.id) as takers
    from
        takes as t
    where
        (
            t.semester = 'Fall'
            and t.year = '2017'
        )
    group by
        t.course_id,
        t.sec_id
)

select
    e.course_id,
    e.sec_id
from
    enrollment as e
where
    e.takers = (
        select max(takers)
        from
            enrollment
    )
