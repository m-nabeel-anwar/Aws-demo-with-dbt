{{
    config(
        materialized='table'
    )
}}
with fact_order as
(
    select
     o_orderkey,
     o_orderstatus,
     o_orderdate,
     getdate()-2 update_dat,
     o_totalprice
      from {{ ref('src_order') }}
    where o_totalprice >10000
)

select * from fact_order