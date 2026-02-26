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

custodian as (
    select
        custodian_code,
        custodian_name,
        region
    from {{ ref('custodians') }}
)

select
    a.account_id,
    a.model_code,
    a.custodian_code,
    c.custodian_name,
    c.region,
    a.advisor_id,
    a.agent_id,
    a.bd_id
from account a
left join custodian c
    on a.custodian_code = c.custodian_code