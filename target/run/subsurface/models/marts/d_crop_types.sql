
  create or replace view "@fab4"."d_crop_types" as (
    select
  crop_code
  ,crop_label
from
  "@fab4"."crop_types"

union all

select
  'N/A'
  ,'N/A'
  )
