{{ config(materialized='table') }}

select
    h.account_id,
    a.model_id,
    h.ticker,
    h.as_of_timestamp,
    h.shares,
    h.market_value
from {{ ref('stg_holdings') }} h
left join {{ ref('dim_account') }} a
    on h.account_id = a.account_id