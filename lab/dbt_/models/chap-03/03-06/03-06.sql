select
    dept_name,
    building,
    budget
from
    universidade.department
where
    lower(dept_name) like '%sci%'
