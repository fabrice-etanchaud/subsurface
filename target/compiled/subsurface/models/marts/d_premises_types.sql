select
  premises_code
  ,premises_label_en as premises_label
from
  "subsurface_space"."reference"."premises_types"

union all

select
  'N/A'
  ,'N/A'