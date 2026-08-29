{% test check_row_count(model, small, large) %}

{% set expected = small if target.name == 'small' else large %}

select 1
from {{ model }}
having count(*) != {{ expected }}

{% endtest %}