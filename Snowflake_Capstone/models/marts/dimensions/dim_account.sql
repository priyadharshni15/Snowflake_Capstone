{{ config(materialized='table') }}

select
    account_id,
    model_code      as model_id,
    advisor_id,
    custodian_code,
    bd_id,
    agent_id,
    is_active
from {{ ref('stg_account') }}