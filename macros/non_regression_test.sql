{%- macro columns_csv(model, columns, alias=true, prefix=none, nullify=false) -%}
    {%- for column in columns -%}
        cast(
        {%- if not nullify -%}
          {{ model }}.{{ column.name }}
        {%- else -%}
          null
        {%- endif %} as {{ column.data_type }}){% if alias %} as
        {%- if prefix is not none %} {{ prefix }}_{%- else %} {% endif -%}{{ column.name }}{% endif %}
        {%- if not loop.last %}, {% endif -%}
    {% endfor -%}
{%- endmacro -%}

{%- macro join_on_columns(model1, model2, columns) -%}
    {%- for column in columns -%}
        {{ model1 }}.{{ column.name }} = {{ model2 }}.{{ column.name }}
        {%- if not loop.last %} and {% endif -%}
    {%- endfor -%}
{%- endmacro -%}

{%- macro columns_inequality(model1, model2, columns) -%}
    {%- for column in columns -%}
      {{ model1 }}.{{ column.name }} is distinct from {{ model2 }}.{{ column.name }}
      {% if not loop.last %} or {% endif -%}
    {%- endfor -%}
{%- endmacro -%}

{% macro non_regression_test(unmanaged_model, managed_model_database, managed_model_schema, managed_model_identifier, pk) %}
-- depends_on: {{ ref(unmanaged_model) }}
{% set unmanaged_model = ref(unmanaged_model) %}
{% set managed_model = api.Relation.create(database=managed_model_database, schema=managed_model_schema, identifier=managed_model_identifier) %}
{% set managed_cols = adapter.get_columns_in_relation(managed_model) %}
{% set managed_colnames = managed_cols | map(attribute='name') | list %}
{% set unmanaged_cols = adapter.get_columns_in_relation(unmanaged_model) %}
{% set unmanaged_colnames = unmanaged_cols | map(attribute='name') | list %}
{% set pk_cols = managed_cols | selectattr('name', 'in', pk) | list %}
{% set pk_colnames = pk_cols | map(attribute='name') | list %}
{% set nrt_cols = unmanaged_cols | rejectattr('name', 'in', pk) | selectattr('name', 'in', managed_colnames) | list %}
{% set nrt_colnames = nrt_cols | map(attribute='name') | list %}

select
  md5(concat({{ columns_csv('managed', pk_cols, alias=false) }})) as tnr_id
  ,{{ columns_csv('managed', pk_cols) }}
  ,'difference' AS change_type
  ,{{ columns_csv('unmanaged', nrt_cols, prefix='unmanaged') }}
  ,{{ columns_csv('managed', nrt_cols, prefix='managed') }}
from {{ managed_model }} as managed
join {{ unmanaged_model }} as unmanaged
  on ({{ join_on_columns('managed', 'unmanaged', pk_cols) }})
where {{ columns_inequality('managed', 'unmanaged', nrt_cols) }}

union all

select
  md5(concat({{ columns_csv('managed', pk_cols, alias=false) }}))
  ,{{ columns_csv('managed', pk_cols, alias=false) }}
  ,'missing'
  ,{{ columns_csv('unmanaged', nrt_cols, prefix='unmanaged', nullify=true, alias=false) }}
  ,{{ columns_csv('managed', nrt_cols, prefix='managed', alias=false) }}
from
  {{ managed_model }} as managed
where not exists (
  select 1
  from {{ unmanaged_model }} as unmanaged
  where ({{ join_on_columns('unmanaged', 'managed', pk_cols) }})
)

union all

select
  md5(concat({{ columns_csv('unmanaged', pk_cols, alias=false) }}))
  ,{{ columns_csv('unmanaged', pk_cols, alias=false) }}
  ,'unexpected'
  ,{{ columns_csv('unmanaged', nrt_cols, prefix='unmanaged', alias=false) }}
  ,{{ columns_csv('managed', nrt_cols, prefix='managed', nullify=true, alias=false) }}
from
  {{ unmanaged_model }} as unmanaged
where not exists (
  select 1
  from {{ managed_model }} as managed
  where ({{ join_on_columns('managed', 'unmanaged', pk_cols) }})
)

{% endmacro %}
