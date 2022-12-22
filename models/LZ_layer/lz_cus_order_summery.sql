
with cus_order as
(
    select 
    id,
    name,
    {{round_value_macro('totalprice',0)}} totalprice
    
    from {{ ref('stg_cus_order') }}
)
select id,
name,
 sum(totalprice) totalprice from cus_order
group by id,name
