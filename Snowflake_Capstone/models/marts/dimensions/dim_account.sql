{{ config(materialized='table') }}
select
    account_id,
    model_code,
    custodian_code,
    advisor_id,
    agent_id,
    bd_id,
    {{ audit_columns() }}
from {{ ref('stg_account') }}