select
    s.id,
    s.name,
    s.dept_name,
    s.tot_cred
from
    student as s
where
    s.tot_cred > 100
