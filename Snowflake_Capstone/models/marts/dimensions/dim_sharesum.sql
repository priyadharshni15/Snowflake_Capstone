{{ config(materialized='table') }}

with account as (

    select
        account_id,
        model_code,
        custodian_code,
        advisor_id,
        agent_id,
        bd_id
    from {{ ref('dim_combined_data') }}

),

holdings as (

    select
        account_id,
        ticker,
        cusip,
        description,
        shares,
        market_value,
        as_of_timestamp
    from {{ ref('holdings_snapshot') }}

),

ticker_shares as (

    {{ aggregated_ticker_shares(ref('holdings_snapshot')) }}

)

select
    a.account_id,
    a.model_code,
    a.custodian_code,
    a.advisor_id,
    a.agent_id,
    a.bd_id,
    h.ticker,
    h.cusip,
    h.description,
    t.total_shares,
    h.market_value,
    h.as_of_timestamp

from account a

join holdings h
    on a.account_id = h.account_id

left join ticker_shares t
    on h.account_id = t.account_id
    and h.ticker = t.ticker