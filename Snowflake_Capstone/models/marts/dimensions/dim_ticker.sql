{{ config(materialized='table') }}
select  
    ticker,
    account_id,
    cusip,
    description,
    shares,
    market_value,
    as_of_timestamp,
    {{ audit_columns() }}
from {{ ref('stg_holdings') }}