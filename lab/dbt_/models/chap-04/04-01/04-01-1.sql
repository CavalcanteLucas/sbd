select
    name,
    title
from
    universidade.instructor
natural join universidade.teaches
natural join universidade.section
natural join universidade.course
where
    semester = 'Spring'
    and year = 2017
