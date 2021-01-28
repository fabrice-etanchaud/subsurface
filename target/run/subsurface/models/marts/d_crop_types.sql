
  create or replace view "subsurface_space"."d_crop_types" as (
    select
  crop_code
  ,crop_label
from
  "subsurface_space"."reference"."crop_types"

union all

select
  'N/A'
  ,'N/A'
  )
