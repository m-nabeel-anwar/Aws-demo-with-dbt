with orders as(
select top 500 * from public.orders
)

select * from orders