select distinct s.id
from
    student as s,
    takes as ta,
    teaches as te,
    instructor as i
where
    (
        s.id = ta.id
        and ta.course_id = te.course_id
        and ta.sec_id = te.sec_id
        and ta.semester = te.semester
        and i.name like 'Einstein'
    )
