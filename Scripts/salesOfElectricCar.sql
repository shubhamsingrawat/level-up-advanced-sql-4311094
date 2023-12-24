select 
sum(salesAmount) as sales_of_electric
from sales
where inventoryId in 
( select inventoryId from 
inventory inv
join model mdl 
ON inv.modelId = mdl.modelId
where mdl.EngineType = 'Electric'
)