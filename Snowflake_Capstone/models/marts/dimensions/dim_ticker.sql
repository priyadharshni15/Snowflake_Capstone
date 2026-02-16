{{ config(materialized='table') }}

select distinct
    ticker,
    cusip,
    description
from {{ ref('stg_holdings') }}