select
    modelid,
    advisorid,
    bdid,
    address,
    sum(marketvalue) as total_shares
from {{ ref('dim_combined_data') }}
group by
    modelid,
    advisorid,
    bdid,
    address
order by 
    modelid