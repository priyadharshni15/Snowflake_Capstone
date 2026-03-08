{% macro aggregated_ticker_shares(relation_name) %}

select
    accountid,
    sum(marketvalue) as Total_AUM
from {{ relation_name }}
group by
    accountid

{% endmacro %}