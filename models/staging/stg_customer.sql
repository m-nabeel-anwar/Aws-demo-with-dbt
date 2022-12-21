with stg_customer as
(
select * from {{ ref('src_Customer') }}
)
select * from stg_customer