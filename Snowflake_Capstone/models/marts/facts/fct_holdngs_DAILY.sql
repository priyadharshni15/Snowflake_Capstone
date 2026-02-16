select
    account_id,
    ticker,
    cusip,
    shares,
    market_value,
    date::date           as as_of_date,
    dbt_valid_from,
    dbt_valid_to
from {{ ref('holdings_snapshot') }}
where dbt_valid_to is null
