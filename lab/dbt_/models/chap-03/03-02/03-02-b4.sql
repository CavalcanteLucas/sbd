select coalesce(sum(n.points * c.credits) / sum(c.credits), 0) as media
from
    universidade.takes as t,
    universidade.nota_pontos as n,
    universidade.course as c
where
    (
        n.grade = t.grade
        and c.course_id = t.course_id
        and t.id = '98988'
    )
