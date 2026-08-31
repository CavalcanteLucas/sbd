select
    id,
    name,
    dept_name,
    salary * 1.1 as salary
from
    {{ ref('03-03-a1') }}
where
    dept_name = 'Comp. Sci.'
