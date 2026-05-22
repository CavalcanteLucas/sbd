select coalesce(sum(n.points * c.credits)/sum(c.credits), 0) as media
from takes t
join nota_pontos n on n.grade = t.grade
join course c on c.course_id = t.course_id
where t.id = '12345'
