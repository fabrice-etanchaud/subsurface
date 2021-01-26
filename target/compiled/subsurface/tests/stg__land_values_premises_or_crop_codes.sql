
with dbt__CTE__INTERNAL_test as (
select
  *
from
  "@fab4"."stg__land_values"
where
  land_surface is not null
  and crop_code is null
)select count(*) from dbt__CTE__INTERNAL_test