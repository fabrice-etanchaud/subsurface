
    
    




select count(*) as validation_errors
from (
    select municipality_code as id from "@fab4"."f_land_values"
) as child
left join (
    select municipality_code as id from "@fab4"."d_municipalities"
) as parent on parent.id = child.id
where child.id is not null
  and parent.id is null


