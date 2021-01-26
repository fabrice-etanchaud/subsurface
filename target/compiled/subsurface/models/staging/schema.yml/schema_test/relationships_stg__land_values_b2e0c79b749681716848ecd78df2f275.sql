
    
    




select count(*) as validation_errors
from (
    select transfer_label_fr as id from "@fab4"."stg__land_values"
) as child
left join (
    select transfer_label_fr as id from "@fab4"."transfer_types"
) as parent on parent.id = child.id
where child.id is not null
  and parent.id is null


