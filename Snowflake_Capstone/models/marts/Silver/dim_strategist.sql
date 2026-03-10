{{ config(materialized='table') }}
select
    strategist_id,
    strategist_code,
    strategist_name,
    {{ audit_columns() }}
from {{ ref('stg_model') }}