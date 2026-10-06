select
    instructor_o.id,
    instructor_o.name,
    instructor_o.salary
from
    universidade.instructor as instructor_o
where
    instructor_o.salary = (
        select max(instructor_i.salary)
        from universidade.instructor as instructor_i
    )
