select
    t.id,
    coalesce(sum(n.points * c.credits) / sum(c.credits), 0) as media
from
    takes as t,
    nota_pontos as n,
    course as c
where
    (
        n.grade = t.grade
        and c.course_id = t.course_id
    )
group by
    t.id
