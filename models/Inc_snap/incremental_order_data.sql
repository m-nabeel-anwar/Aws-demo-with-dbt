{{
    config(
        materialized='incremental'
    )
}}

with inc_order as
(
select * from {{ ref('order_data') }}
 {% if is_incremental() %}
    where update_at >= (select max(update_at) from {{ this }})
    {% endif %}
)

select * from inc_order