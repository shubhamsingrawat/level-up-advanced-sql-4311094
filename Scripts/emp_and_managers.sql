select 
e1.firstName as emp_firstname,
e1.lastName as emp_lastname,
mng.firstName as mng_firstname,
mng.lastName as mng_lastname
FROM employee as e1
join employee as mng
ON e1.employeeId = mng.managerID