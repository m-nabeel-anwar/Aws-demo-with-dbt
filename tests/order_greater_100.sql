
select id , sum(totalprice) totalprice from {{ ref('lz_cus_order_summery') }}
group by id
having sum(totalprice) <= 100