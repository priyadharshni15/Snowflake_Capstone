{{ config(materialized='table') }}
{{ aggregated_ticker_shares(ref('stg_holdings')) }}
