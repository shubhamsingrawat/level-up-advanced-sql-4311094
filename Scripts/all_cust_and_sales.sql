SELECT
cst.firstName, cst.lastName, cst.email,sls.salesAmount,
sls.soldDate
FROM customer cst
INNER JOIN sales sls 
ON cst.customerId = sls.customerId
-- TO get the customer whoes sale data might get loss
UNION
SELECT
cst.firstName, cst.lastName, cst.email,sls.salesAmount,
sls.soldDate
FROM customer cst
LEFT JOIN sales sls 
ON cst.customerId = sls.customerId
AND sls.salesId IS NULL
-- TO get the customer missnig from sales
UNION
SELECT
cst.firstName, cst.lastName, cst.email,sls.salesAmount,
sls.soldDate
FROM sales sls
LEFT JOIN customer cst 
ON cst.customerId = sls.customerId
AND cst.customerId IS NULL