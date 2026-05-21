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
