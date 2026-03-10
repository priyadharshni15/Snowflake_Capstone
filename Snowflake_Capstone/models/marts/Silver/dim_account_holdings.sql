select
    accountid,
    modelid,
    advisorid,
    bdid,
    address,
    sum(marketvalue) as total_shares
from {{ ref('dim_combined_data') }}
group by
    accountid,
    modelid,
    advisorid,
    bdid,
    address
order by accountid