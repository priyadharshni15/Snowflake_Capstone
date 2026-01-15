{% macro rename_columns(mapping) %}
  {% for source_col, target_col in mapping.items() %}
    {{ source_col }} as {{ target_col }}{% if not loop.last %},{% endif %}
  {% endfor %}
{% endmacro %}