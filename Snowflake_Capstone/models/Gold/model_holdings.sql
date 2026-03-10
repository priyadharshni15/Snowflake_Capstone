select
    modelid,
    advisorid,
    bdid,
    address,
    ({{ aggregated_ticker_shares(ref('combined_data')) }}) as Total_AUM
from {{ ref('combined_data') }}
group by
    modelid,
    advisorid,
    bdid,
    address
order by 
    modelid