select
    coalesce(sum(n.points * c.credits), 0) as creditos
from
    takes as t,
    nota_pontos as n,
    course as c
where
    (
        t.grade = n.grade
        and t.course_id = c.course_id
        and t.id = '98988'
    );