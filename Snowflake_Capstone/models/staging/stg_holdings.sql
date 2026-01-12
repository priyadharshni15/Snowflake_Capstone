{{ config(materialized='view') }}

select
    snam                as account_id,
    ticker,
    cusip,
    share               as shares,
    mv                  as market_value,
    description,
    date                as as_of_timestamp
from {{ source('account_transaction', 'holdings') }}