select
    name,
    title
from
    instructor
    natural join teaches
    natural join section
    natural join course
where
    semester = 'Spring'
    and year = 2017