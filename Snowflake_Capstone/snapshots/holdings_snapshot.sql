{% snapshot holdings_snapshot %}

{{
  config(
    target_schema='snapshots',
    unique_key=['account_id','ticker','as_of_timestamp'],
    strategy='timestamp',
    updated_at='as_of_timestamp'
  )
}}

select
    account_id,
    ticker,
    cusip,
    shares,
    market_value,
    description,
    as_of_timestamp
from {{ ref('stg_holdings') }}

{% endsnapshot %}