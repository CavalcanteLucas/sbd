select
    sum(
        n.points * c.credits
    ) as creditos
from
    universidade.takes as t,
    universidade.nota_pontos as n,
    universidade.course as c
where
    (
        t.grade = n.grade
        and t.course_id = c.course_id
        and t.id = '12345'
    )
