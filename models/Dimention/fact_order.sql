{{
    config(
        materialized='incremental'
    )
}}

with fact_order as
(
    select
     o_orderkey,
     o_orderstatus,
     o_orderdate,
     o_totalprice
      from {{ ref('src_order') }}
    
    where o_totalprice >10000
),



 inc_model(

Select * from fact_order
{% if is_incremental() %}
	Where o_totalprice >= ( Select min(o_totalprice) from  {{ this }} )
	{% endif %}
),

select * from inc_model