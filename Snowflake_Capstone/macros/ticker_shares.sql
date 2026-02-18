{% macro aggregated_ticker_shares(relation_name) %}

select
    account_id,
    ticker,
    sum(shares) as total_shares
from {{ relation_name }}
group by
    account_id,
    ticker

{% endmacro %}
