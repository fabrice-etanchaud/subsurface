select
  crop_code
  ,crop_label
from
  {{ ref('crop_types') }}

union all

select
  'N/A'
  ,'N/A'
