select
    accountid,
    ticker,
    modelid,
    advisorid,
    sum(shares) as total_shares
from {{ ref('dim_combined_data') }}
group by
    accountid,
    ticker,
    modelid,
    advisorid