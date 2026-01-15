{% snapshot holdings_snapshot %}

{{
  config(
    target_schema='snapshots',
    unique_key="snam || '-' || ticker",
    strategy='timestamp',
    updated_at='date'
  )
}}

select
    snam            as account_id,
    ticker,
    cusip,
    share           as shares,
    mv              as market_value,
    description,
    date
from {{ source('account_transaction', 'holdings') }}

{% endsnapshot %}
