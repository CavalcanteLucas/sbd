-- a

select * 
from instructor
where dept_name = 'Comp. Sci.'

update instructor
set salary = salary * 1.1
where dept_name = 'Comp. Sci.'

select * 
from instructor
where dept_name = 'Comp. Sci.'

-- b

select course_id from course where course_id not in (
  select course_id from section
)

delete from course
where course_id not in (
  select course_id from section
)

select course_id from course where course_id not in (
  select course_id from section
)

-- c

select *
from student
where tot_cred > 100
  
insert into instructor
select s.id, s.name, s.dept_name, 10000.00 as salary
  from student s
  where tot_cred > 100  

select conname, pg_get_constraintdef(oid)
  from pg_constraint
  where conname like 'instructor_salary_check';
