{% snapshot holdings_snapshot %}

{{
  config(
    target_schema='snapshots',
    unique_key=['pk_id','accountid','ticker'],
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