select
    id,
    name,
    dept_name,
    salary * 1.1 as salary
from
    instructor
where
    dept_name = 'Comp. Sci.'
