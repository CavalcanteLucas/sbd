select coalesce(sum(n.points * c.credits), 0) as creditos
from takes t
join nota_pontos n on n.grade = t.grade
join course c on c.course_id = t.course_id
where t.id = '98988'
