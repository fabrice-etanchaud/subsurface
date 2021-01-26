
  create or replace view "@fab4"."d_premises_types" as (
    select
  premises_code
  ,premises_label_en as premises_label
from
  "@fab4"."premises_types"

union all

select
  'N/A'
  ,'N/A'
  )
