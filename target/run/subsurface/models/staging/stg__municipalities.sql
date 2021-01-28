
  create or replace view "subsurface_space"."stage"."stg__municipalities" as (
    select
    com_code as municipality_code
    ,com_nom as municipality_label
    ,dep_code as department_code
    ,dep_nom_num as department_label
    ,reg_code as region_code
    ,reg_nom as region_label
from
  "subsurface_datalake"."geo"."communes.csv"
  )
