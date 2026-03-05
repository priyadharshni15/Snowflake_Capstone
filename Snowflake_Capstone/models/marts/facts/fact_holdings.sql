{{ config(materialized='table') }}
select
    h.account_id,
    a.model_code as model_id,
    h.ticker,
    h.shares,
    h.market_value,
    {{ audit_columns() }}
from {{ ref('holdings_snapshot') }} h
inner join {{ ref('dim_combined_data') }} a
    on h.account_id = a.account_id