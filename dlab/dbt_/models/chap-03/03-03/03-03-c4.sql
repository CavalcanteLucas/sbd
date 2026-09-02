select *
from
    instructor
union all
select
    s.id,
    s.name,
    s.dept_name,
    10000.00 as salary
from
    student as s
where
    tot_cred > 100
