{{ 
  config(
    materialized='incremental',
    unique_key='accountid',
    incremental_strategy='merge',
    on_schema_change='sync_all_columns'
  ) 
}}

select
    accountid,
    address,
    modelid,
    advisorid,
    bdid,
    {{ normalize_null('custodian') }} as custodian,
    {{ normalize_boolean('isactive') }} as isactive

from {{ source('account_transaction', 'account') }}
where {{ active_accounts() }}