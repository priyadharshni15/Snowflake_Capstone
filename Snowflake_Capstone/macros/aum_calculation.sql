{% macro aggregated_AUM(relation_name) %}
select
    sum(marketvalue)
from {{ relation_name }}
{% endmacro %}