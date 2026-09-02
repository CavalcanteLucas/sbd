select
    dept_name,
    building,
    budget
from
    department
where
    lower(dept_name) like '%sci%'
