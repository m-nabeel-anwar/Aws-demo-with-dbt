with customer as(
select top 500 * from public.customer
)

select * from customer