select
  *
from
  {{ ref('stg__land_values') }}
where
  built_surface is not null
  and premises_code is null
