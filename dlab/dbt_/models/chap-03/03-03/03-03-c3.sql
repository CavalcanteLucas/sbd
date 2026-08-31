select
    pc.conname,
    pc.pg_get_constraintdef(pc.oid) as pc_oid
from
    pg_constraint as pc
where
    pc.conname like 'instructor_salary_check'
