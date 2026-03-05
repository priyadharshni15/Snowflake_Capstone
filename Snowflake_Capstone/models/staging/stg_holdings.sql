{{ config(materialized='view') }}

select
    pk_id,
    accountid,
    ticker,
    cusip,
    shares,
    marketvalue,
    description,
    date
from {{ source('account_transaction', 'holdings') }}