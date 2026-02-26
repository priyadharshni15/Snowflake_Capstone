{{ config(materialized='table') }}
{{ aggregated_ticker_shares(ref('fact_holdings')) }}