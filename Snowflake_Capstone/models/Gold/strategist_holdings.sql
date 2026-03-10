select
    strategistid,
    modelid,
    advisorid,
    bdid,
    address,
    sum(marketvalue) as total_shares
from {{ ref('combined_data') }}
group by
    strategistid,
    modelid,
    advisorid,
    bdid,
    address
order by 
    strategistid