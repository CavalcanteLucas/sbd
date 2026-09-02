with section_ as (
    select
        s.course_id,
        s.sec_id,
        s.semester,
        s.year,
        s.building,
        s.room_number,
        s.time_slot_id
    from
        section as s
    union all
    select
        'BIO-101' as s_course_id,
        '2' as s_sec_id,
        'Fall' as s_semester,
        2017 as s_year,
        'Painter' as s_building,
        '514' as s_room_number,
        'B' as s_time_slot_id
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
