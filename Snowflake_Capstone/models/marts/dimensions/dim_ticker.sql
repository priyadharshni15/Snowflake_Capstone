{{ config(materialized='table') }}

select distinct 
    ticker,
    account_id,
    cusip,
    description
from {{ ref('stg_holdings') }}