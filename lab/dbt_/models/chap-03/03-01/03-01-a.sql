select title
from
    course
where
    (
        credits = 3
        and dept_name = 'Comp. Sci.'
    )
