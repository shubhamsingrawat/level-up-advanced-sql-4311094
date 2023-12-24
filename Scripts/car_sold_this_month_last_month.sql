select 
strftime('%Y',sls.soldDate) as sls_year,
strftime('%m',sls.soldDate) as sls_month,
count(sls.inventoryId) as tlt_car_sales
FROM sales sls
group by 1,2

-- car sold this month and last month
with car_sold_each_mnth as (
select 
strftime('%Y',sls.soldDate) as sls_year,
strftime('%m',sls.soldDate) as sls_month,
count(sls.inventoryId) as tlt_car_sales
FROM sales sls
group by 1,2 
)
select sls_year, sls_month,
lag(tlt_car_sales) over ( PARTITION BY sls_year
order by sls_year, sls_month) as sales_pre_month,
tlt_car_sales as curent_mth_sales
from car_sold_each_mnth