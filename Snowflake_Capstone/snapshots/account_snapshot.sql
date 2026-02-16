{% snapshot account_snapshot %}

{{
  config(
    target_schema='snapshots',
    unique_key='account_id',
    strategy='check',
    check_cols=['model_code','advisor_id','is_active']
  )
}}

select *
from {{ ref('stg_account') }}

{% endsnapshot %}