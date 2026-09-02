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
    e_o.course_id,
    e_o.sec_id
from
    enrollment as e_o
where
    e_o.takers = (
        select max(e_i.takers)
        from
            enrollment as e_i
    )
