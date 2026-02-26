{{ config(materialized='table') }}
select
    a.account_id,
    a.model_code,
    a.custodian_code,
    a.advisor_id,
    a.bd_id,
    h.ticker,
    h.cusip,
    h.description,
    m.model_name,
    m.strategist_id,
    m.strategist_code,
    m.strategist_name,
    h.shares,
    h.market_value
from {{ref ('dim_ticker')}} h 
left join {{ref('dim_account')}} a 
    on a.account_id = h.account_id
left join {{ref('dim_model')}} m 
    on a.model_code = m.model_id
