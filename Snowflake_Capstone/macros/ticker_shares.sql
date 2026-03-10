{% macro aggregated_ticker_shares(relation_name) %}
select
    sum(marketvalue)
from {{ relation_name }}
{% endmacro %}