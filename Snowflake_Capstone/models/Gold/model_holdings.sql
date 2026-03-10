select
    modelid,
    advisorid,
    bdid,
    address,
    sum(marketvalue) as Total_AUM
from {{ ref('combined_data') }}
group by
    modelid,
    advisorid,
    bdid,
    address
order by 
    modelid