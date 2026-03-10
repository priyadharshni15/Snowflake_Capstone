{{ config(materialized='table') }}

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
    
from {{ source('account_transaction', 'holdings') }}