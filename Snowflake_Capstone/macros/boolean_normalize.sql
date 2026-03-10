{% macro normalize_boolean(column) %}
  case
    when lower({{ column }}) in ('1','true','Yes','y') then true
    when lower({{ column }}) in ('0','false','No','n') then false
    else null
  end
{% endmacro %}