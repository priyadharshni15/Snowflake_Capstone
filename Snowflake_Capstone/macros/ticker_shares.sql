{% macro aggregated_ticker_shares(relation_name) %}

select
    accountid,
    ticker,
    sum(shares) as total_shares
from {{ relation_name }}
group by
    accountid,
    ticker

{% endmacro %}