{% macro normalize_null(column, default_value="'UNKNOWN'") %}
  coalesce(nullif(trim({{ column }}), ''), {{ default_value }})
{% endmacro %}