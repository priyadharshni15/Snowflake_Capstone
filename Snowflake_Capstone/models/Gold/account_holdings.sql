select
    accountid,
    modelid,
    advisorid,
    bdid,
    address,
    ({{ aggregated_AUM(ref('combined_data')) }}) as Total_AUM
from {{ ref('combined_data') }}
group by
    accountid,
    modelid,
    advisorid,
    bdid,
    address
order by accountid