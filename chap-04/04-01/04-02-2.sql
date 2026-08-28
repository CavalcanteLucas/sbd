select
    table_name,
    column_name
from
    information_schema.columns
where
    table_name in ('instructor', 'teaches', 'section', 'course')
order by
    table_name asc