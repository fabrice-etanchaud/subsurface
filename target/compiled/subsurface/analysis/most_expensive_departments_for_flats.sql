select
  d_municipalities.department_code
  ,d_municipalities.department_label
  ,avg(f_land_values.transaction_amount / f_land_values.built_surface)
from
  "@fab4"."f_land_values" as f_land_values
  join "@fab4"."d_municipalities" as d_municipalities on d_municipalities.municipality_code = f_land_values.municipality_code
where
  f_land_values.premises_code = '2'
  and f_land_values.built_surface > 0
  and f_land_values.land_surface = 0
  and f_land_values.transfer_label = 'Sale'
group by
  d_municipalities.department_code
  ,d_municipalities.department_label
order by
  3 desc