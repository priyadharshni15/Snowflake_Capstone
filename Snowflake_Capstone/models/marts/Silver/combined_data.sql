{{ config(materialized='table') }}

with account as (
    select
        account_id,
        model_code,
        custodian_code,
        advisor_id,
        agent_id,
        bd_id,
        {{ audit_columns() }}
    from {{ ref('stg_account') }}
),

model as (
    select
        model_id,
        model_name,
        strategist_id,
        strategist_code,
        strategist_name
    from {{ ref('stg_model') }}
),

holdings as (
    select
        account_id,
        ticker,
        shares,
        market_value,
        as_of_timestamp
    from {{ ref('holdings_snapshot') }}
)

select
    a.account_id,
    a.model_code,
    m.model_name,
    m.strategist_id,
    m.strategist_code,
    m.strategist_name,
    a.custodian_code,
    a.advisor_id,
    a.agent_id,
    a.bd_id,
    h.ticker,
    h.shares,
    h.market_value,
    h.as_of_timestamp
from account a

inner join model m
    on a.model_code = m.model_id

inner join holdings h
    on a.account_id = h.account_id