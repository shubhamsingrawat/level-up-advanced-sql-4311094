-- sales per year
WITH yearly_sales as (
select salesAmount,
strftime('%Y',soldDate) as sales_year 
FROM sales 
)
Select sales_year,sum(salesAmount) FROM
yearly_sales
Group by 1 ORDER BY 1;