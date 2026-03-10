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
    custodian,
    isactive
from {{ source('account_transaction', 'account') }}
where {{ active_accounts() }}