{{ config(materialized='table') }}

with model as (
    select
        model_id,
        model_name,
        strategist_id,
        {{ audit_columns() }}
    from {{ ref('stg_model') }}
),

model_risk as (
    select
        model_name,
        risk_category
    from {{ ref('model_risk_category') }}
)

select
    m.model_id,
    m.model_name,
    m.strategist_id,
    r.risk_category
from model m
left join model_risk r
    on m.model_name = r.model_name