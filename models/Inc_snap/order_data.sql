{{
    config(
        materialized='table'
    )
}}
with orders as(
select  * from {{ ref('src_order') }} where o_totalprice >20000
)
select 
o_orderkey,
o_totalprice,
o_orderdate,
GETDATE()-3 update_at
from orders  