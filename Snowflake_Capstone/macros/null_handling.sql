{% macro normalize_null(column) %}
  nullif(trim({{ column }}), '')
{% endmacro %}