select
    table_name,
    column_name
from "respostas_chap-04_question-01"."04-01-2"
where column_name in (
    select column_name from (
        select
            column_name,
            count(column_name)
        from "respostas_chap-04_question-01"."04-01-2"
        group by column_name
        having count(column_name) > 1
    )
)
