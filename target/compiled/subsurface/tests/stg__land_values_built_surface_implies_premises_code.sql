
with dbt__CTE__INTERNAL_test as (
select
  *
from
  "@fab4"."stg__land_values"
where
  built_surface is not null
  and premises_code is null
)select count(*) from dbt__CTE__INTERNAL_test