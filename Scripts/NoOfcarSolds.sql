-- No of car sold per emp;
select 
e.employeeId,e.firstname,e.lastname,count(sls.salesId) as noOfCarSold
FROM employee e
join sales sls
ON e.employeeId = sls.employeeId
group by 1,2,3;

-- Least and most expensive car
select 
e.employeeId,e.firstname,e.lastname,
min(sls.salesAmount) as leastExpensive,
max(sls.salesAmount) as mostExpensive
FROM employee e
join sales sls
ON e.employeeId = sls.employeeId
group by 1,2,3;

-- emp sold more then 5 cars
select 
e.employeeId,e.firstname,e.lastname,count(sls.salesId) as noOfCarSold
FROM employee e
join sales sls
ON e.employeeId = sls.employeeId
group by 1,2,3
having noOfCarSold > 5;
