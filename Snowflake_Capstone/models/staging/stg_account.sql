{{ config(materialized='view') }}

select
    accountid           as account_id,
    modelcode           as model_code,
    custodiancode       as custodian_code,
    advisorid           as advisor_id,
    agentid             as agent_id,
    bdid                as bd_id,
    isactive            as is_active
from {{ source('account_transaction', 'account') }}