{{ 
  config(
    materialized='incremental',
    unique_key='account_id',
    incremental_strategy='merge',
    on_schema_change='sync_all_columns'
  ) 
}}

select
    accountid as account_id,
    modelcode as model_code,
    {{ normalize_null('custodiancode') }} as custodian_code,
    advisorid as advisor_id,
    agentid as agent_id,
    bdid as bd_id,
    {{ normalize_boolean('isactive') }} as is_active

from {{ source('account_transaction', 'account') }}
where {{ active_accounts() }}