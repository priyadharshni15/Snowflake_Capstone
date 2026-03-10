select
    accountid,
    modelid,
    advisorid,
    bdid,
    address,
    sum(marketvalue) as total_shares
from {{ ref('combined_data') }}
group by
    accountid,
    modelid,
    advisorid,
    bdid,
    address
order by accountid