-- Safe numeric casting and avoids Snowflake errors

{% macro safe_numeric(column, precision=18, scale=2) %}
  try_cast({{ column }} as number({{ precision }}, {{ scale }}))
{% endmacro %}