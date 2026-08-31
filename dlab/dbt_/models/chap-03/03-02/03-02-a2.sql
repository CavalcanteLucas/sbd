select
    sum(
        n.points * c.credits
    ) as creditos
from
    takes as t,
    {{ ref('nota_pontos') }} as n,
    course as c
where
    (
        t.grade = n.grade
        and t.course_id = c.course_id
        and t.id = '70557'
    )
