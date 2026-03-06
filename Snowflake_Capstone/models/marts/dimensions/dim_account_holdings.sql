{{ config(
    materialized='table'
) }}

select
    accountid,
    ticker,
    max(modelid) as modelid,
    max(advisorid) as advisorid,
    max(bdid) as bdid,
    max(custodian) as custodian,
    max(strategistid) as strategistid,
    max(strategistcode) as strategistcode,
    max(strategistname) as strategistname,
    max(marketvalue) as marketvalue,
    max(description) as description,
    {{ aggregated_ticker_shares('shares') }} as total_shares

from {{ ref('dim_combined_data') }}

group by
    accountid,
    ticker