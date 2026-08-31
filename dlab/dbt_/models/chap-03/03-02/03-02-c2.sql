select
    t.id,
    coalesce(sum(n.points * c.credits) / sum(c.credits), 0) as media
from
    takes as t,
    {{ ref('nota_pontos') }} as n,
    course as c
where
    (
        n.grade = t.grade
        and c.course_id = t.course_id
    )
group by
    t.id
union
select
    id,
    0 as s_exists
from
    student as s
where
    not exists (
        select 1
        from
            takes as t
        where
            t.id = s.id
    )
