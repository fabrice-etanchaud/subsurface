
  create or replace view "@fab4"."stg__municipalities" as (
    select
    com_code as municipality_code
    ,com_nom as municipality_label
    ,dep_code as department_code
    ,dep_nom_num as department_label
    ,reg_code as region_code
    ,reg_nom as region_label
from
  "fs"."geo"."communes.csv"
  )
