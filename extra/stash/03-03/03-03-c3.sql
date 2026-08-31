select
  conname,
  pg_get_constraintdef (oid)
from
  pg_constraint
where
  conname like 'instructor_salary_check';