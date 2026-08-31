with section_ as (
    select *
    from
        section
    union all
    select
        'BIO-101',
        '2',
        'Fall',
        2017,
        'Painter',
        '514',
        'B'
)

select
    s.course_id,
    s.sec_id,
    (
        select count(*)
        from
            takes as t
        where
            t.course_id = s.course_id
            and t.semester = s.semester
            and t.year = s.year
            and t.sec_id = s.sec_id
    ) as takers
from
    section_ as s
where
    (
        s.semester = 'Fall'
        and s.year = '2017'
    )
