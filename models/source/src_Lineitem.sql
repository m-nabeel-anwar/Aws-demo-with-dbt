with lineitem as(
select top 500 * from public.lineitem
)

select * from lineitem