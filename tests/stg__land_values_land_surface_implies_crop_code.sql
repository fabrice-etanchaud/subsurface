select
  *
from
  {{ ref('stg__land_values') }}
where
  land_surface is not null
  and crop_code is null
