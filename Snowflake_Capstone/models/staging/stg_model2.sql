{{
  config(
      materialized='incremental',
      incremental_strategy='append'
  )
}}

select
    aplid               as model_id,
    modelname           as model_name,
    strategistid        as strategist_id,
    strategistcode      as strategist_code,
    strategistname      as strategist_name
from {{ source('account_transaction', 'model') }}