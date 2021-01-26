select
  d_municipalities.department_code
  ,d_municipalities.department_label
  ,sum(f_land_values.transaction_amount) / sum(f_land_values.built_surface)
from
  "@fab4"."f_land_values" as f_land_values
  join "@fab4"."d_municipalities" as d_municipalities on d_municipalities.municipality_code = f_land_values.municipality_code
where
  f_land_values.built_surface > 0
group by
  d_municipalities.department_code
  ,d_municipalities.department_label
order by
  3 desc
limit 100
