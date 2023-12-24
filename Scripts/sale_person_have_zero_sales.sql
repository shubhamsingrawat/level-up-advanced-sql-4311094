select 
e1.firstName,
e1.lastName,
e1.title,
sls.salesId
FROM employee e1
LEFT JOIN sales sls 
ON e1.employeeId = sls.employeeId
where e1.title = 'Sales Person'
AND sls.salesId IS NULL