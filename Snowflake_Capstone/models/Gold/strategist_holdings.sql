select
    strategistid,
    modelid,
    advisorid,
    bdid,
    address,
    sum(marketvalue) as Total_AUM
from {{ ref('combined_data') }}
group by
    strategistid,
    modelid,
    advisorid,
    bdid,
    address
order by 
    strategistid