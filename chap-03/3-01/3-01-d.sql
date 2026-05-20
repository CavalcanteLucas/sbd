select id, name, salary
from instructor
where salary = (
  select max(salary)
  from instructor
)
