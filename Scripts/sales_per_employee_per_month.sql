-- Sales per employee each month
SELECT
e.firstname, 
e.lastname, 
sum(case when strftime('%m',sls.soldDate) = '01' 
then sls.salesAmount 
ELSE NULL END ) as 'janSales',
sum(case when strftime('%m',sls.soldDate) = '02' 
then sls.salesAmount 
ELSE NULL END ) as 'febSales',
sum(case when strftime('%m',sls.soldDate) = '03' 
then sls.salesAmount 
ELSE NULL END) as 'marSales',
sum(case when strftime('%m',sls.soldDate) = '04'
 then sls.salesAmount 
 ELSE NULL END) as 'aprilSales',
sum(case when strftime('%m',sls.soldDate) = '05' 
then sls.salesAmount 
ELSE NULL END) as 'maySales',
sum(case when strftime('%m',sls.soldDate) = '06' 
then sls.salesAmount 
ELSE NULL END) as 'juneSales',
sum(case when strftime('%m',sls.soldDate) = '07' 
then sls.salesAmount ELSE NULL END ) as 'julySales',
sum(case when strftime('%m',sls.soldDate) = '08' 
then sls.salesAmount ELSE NULL END ) as 'augSales',
sum(case when strftime('%m',sls.soldDate) = '09' 
then sls.salesAmount ELSE NULL END ) as 'septSales',
sum(case when strftime('%m',sls.soldDate) = '10' 
then sls.salesAmount ELSE NULL END ) as 'octSales',
sum(case when strftime('%m',sls.soldDate) = '11' 
then sls.salesAmount ELSE NULL END ) as 'novSales',
sum(case when strftime('%m',sls.soldDate) = '12' 
then sls.salesAmount ELSE NULL END ) as 'decSales'
from employee e
join sales sls
on e.employeeId = sls.employeeId
Where strftime('%Y',sls.soldDate) = '2021'
group by 1,2
order by 1,2;

