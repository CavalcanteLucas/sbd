{{ config(materialized='view') }}

with answer as (

    select
        title
    from
        {{ source('uni', 'course')}}
    where
        (
            credits = 3
            and dept_name = 'Comp. Sci.'
        )

)

select *
from answer
