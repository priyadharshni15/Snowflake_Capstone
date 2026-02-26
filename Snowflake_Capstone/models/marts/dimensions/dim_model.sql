{{ config(materialized='table') }}
select
    model_id,
    model_name,
    strategist_id,
    strategist_code,
    strategist_name,
    {{ audit_columns() }}
from {{ ref('stg_model') }}