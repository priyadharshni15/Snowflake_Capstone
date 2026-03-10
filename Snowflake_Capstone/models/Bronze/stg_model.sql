{{
  config(
      materialized='incremental',
      incremental_strategy='append'
  )
}}

select
    modelid,
    modelname,
    strategistid,
    strategistcode,
    strategistname
from {{ source('account_transaction', 'model') }}