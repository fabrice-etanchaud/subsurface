select
  crop_code
  ,crop_label
from
  "subsurface_space"."reference"."crop_types"

union all

select
  'N/A'
  ,'N/A'