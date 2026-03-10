select
    strategistid,
    modelid,
    advisorid,
    bdid,
    address,
    ({{ aggregated_AUM(ref('combined_data')) }}) as Total_AUM
from {{ ref('combined_data') }}
group by
    strategistid,
    modelid,
    advisorid,
    bdid,
    address
order by 
    strategistid