select distinct s.id
from
    universidade.student as s,
    universidade.takes as ta,
    universidade.teaches as te,
    universidade.instructor as i
where
    (
        s.id = ta.id
        and ta.course_id = te.course_id
        and ta.sec_id = te.sec_id
        and ta.semester = te.semester
        and i.name like 'Einstein'
    )
