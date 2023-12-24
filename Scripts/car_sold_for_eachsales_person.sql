--- for each sales person rank the modle they solds
select emp.firstname,emp.lastname,mdl.model
,count(mdl.model),
rank() over( PARTITION BY sls.employeeId 
ORDER BY count(mdl.model) DESC ) as modle_rank
from Sales sls
join employee emp
on sls.employeeId = emp.employeeId
join inventory inv
on sls.inventoryId = inv.inventoryId
join model mdl 
on inv.modelId = mdl.modelId
group by 1,2,3
order by 1,2;