select
  crop_code
  ,crop_label
from
  "@fab4"."crop_types"

union all

select
  'N/A'
  ,'N/A'