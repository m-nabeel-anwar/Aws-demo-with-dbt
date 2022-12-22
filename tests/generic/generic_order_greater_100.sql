{%- test generic_order_greater_100(model,column_name)-%}

select
{{ column_name }}
from
{{ model }}
where round({{ column_name }},0) <=100

{%- endtest -%}