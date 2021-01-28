
  create or replace view "subsurface_space"."f_land_values" as (
    select
  transaction_date
  ,coalesce(transaction_amount, 0) as transaction_amount
  ,transfer_types.transfer_label_en as transfer_label
  ,coalesce(lane_type, 'N/A') as lane_type
  ,coalesce(lane_code, 'N/A') as lane_code
  ,coalesce(lane, 'N/A') as lane
  ,coalesce(zip_code, 'N/A') as zip_code
  ,municipality_code
  ,lots_count
  ,coalesce(premises_code, 'N/A') as premises_code
  ,coalesce(built_surface, 0) as built_surface
  ,coalesce(land_surface, 0) as land_surface
  ,coalesce(main_rooms_count, 0) as main_rooms_count
  ,coalesce(crop_code, 'N/A') as crop_code
from
  "subsurface_space"."stage"."stg__land_values" as stg__land_values
  join "subsurface_space"."reference"."transfer_types" transfer_types on transfer_types.transfer_label_fr = stg__land_values.transfer_label_fr
  )
