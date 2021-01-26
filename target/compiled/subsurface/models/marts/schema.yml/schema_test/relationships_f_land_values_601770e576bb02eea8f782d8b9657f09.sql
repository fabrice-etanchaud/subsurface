
    
    




select count(*) as validation_errors
from (
    select premises_code as id from "@fab4"."f_land_values"
) as child
left join (
    select premises_code as id from "@fab4"."d_premises_types"
) as parent on parent.id = child.id
where child.id is not null
  and parent.id is null


