{% snapshot holdings_snapshot %}

{{
  config(
    target_schema='snapshots',
    unique_key=['pk_id','accountid','ticker'],
    strategy='timestamp',
    updated_at='date'
  )
}}

select
    pk_id,
    accountid,
    ticker,
    cusip,
    shares,
    marketvalue,
    date,
    description,
    strategistid
from {{ ref('stg_holdings') }}

{% endsnapshot %}