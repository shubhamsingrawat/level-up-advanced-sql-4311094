-- getting sales per month in year
select 
strftime('%Y',sls.soldDate) as sls_year,
strftime('%m',sls.soldDate) as sls_month,
salesAmount
FROM sales sls
order by 2,1

-- getting the group by results
select 
strftime('%Y',sls.soldDate) as sls_year,
strftime('%m',sls.soldDate) as sls_month,
sum(sls.salesAmount) as total_sales
FROM sales sls
group by 1,2 
order by 1,2

-- getting the running sum per month / year
-- getting the group by results
with sales_per_month as (
select 
strftime('%Y',sls.soldDate) as sls_year,
strftime('%m',sls.soldDate) as sls_month,
sum(sls.salesAmount) as total_sales
FROM sales sls
group by 1,2 
)
select sls_year, sls_month,
sum(total_sales) over ( PARTITION BY sls_year
order by sls_year, sls_month ) as running_total
from sales_per_month
order by sls_year, sls_month