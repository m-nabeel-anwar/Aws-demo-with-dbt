
with cus_order as
(

select cs.c_custkey Id ,cs.c_name Name,odr.o_totalprice totalprice , odr.o_orderdate from
{{ ref('src_Customers') }} cs
join
{{ source('public', 'orders') }} odr
on cs.c_custkey= odr.o_custkey

)
select * from cus_order