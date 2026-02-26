{{ config(materialized='table') }}
--select
--    *
--from {{ref('dim_account')}} a 
--left join {{('dim_ticker')}} h 
--    on a.account_id = h.account_id
select
    a.account_id,
    a.model_code,
    a.custodian_code,
    a.advisor_id,
    a.bd_id,
    h.ticker,
    h.cusip,
    h.description,
    h.shares,
    h.market_value
from {{ref ('dim_ticker')}} h 
left join {{ref('dim_account')}} a 
    on a.account_id = h.account_id