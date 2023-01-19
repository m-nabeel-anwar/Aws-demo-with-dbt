 {{
    config(
        schema='edw_dev_testing_dbt',materialized='table',sort='nation_id',dist='even'
    )
}}
with nation as(
select * from {{ ref('src_nation') }}
),

region as(
select * from 
{{ source('public', 'region') }}
-- change

),

nation_region as
(
select n.n_nationkey Nation_id,
n.n_name Namtion_name,
r.r_name Region_name
from nation  n
join 
region r
on
n.n_regionkey= r.r_regionkey
)
select * from nation_region