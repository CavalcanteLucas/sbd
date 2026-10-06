select title
from
    universidade.course
where
    (
        credits = 3
        and dept_name = 'Comp. Sci.'
    )
