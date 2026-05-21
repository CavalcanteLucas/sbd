select distinct s.id
from student s
join takes t on s.id = t.id
join teaches tt on t.course_id = tt.course_id
join instructor i on tt.id = i.id
where i.name = 'Einstein'
