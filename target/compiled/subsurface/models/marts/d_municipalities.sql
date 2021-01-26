select
  municipality_code
  ,municipality_label
  ,department_code
  ,department_label
  ,region_code
  ,region_label
from
  "@fab4"."stg__municipalities"

union all

select
  'N/A'
  ,'N/A'
  ,'N/A'
  ,'N/A'
  ,'N/A'
  ,'N/A'