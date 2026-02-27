{{ config(materialized='table') }}
select
    h.account_id,
    a.model_code as model_id,
    h.ticker,
    h.shares,
    h.market_value,
    {{ audit_columns() }}
from {{ ref('stg_holdings') }} h
inner join {{ ref('dim_account') }} a
    on h.account_id = a.account_id