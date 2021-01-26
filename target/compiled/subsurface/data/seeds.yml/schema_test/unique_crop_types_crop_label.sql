
    
    



select count(*) as validation_errors
from (

    select
        crop_label

    from "@fab4"."crop_types"
    where crop_label is not null
    group by crop_label
    having count(*) > 1

) validation_errors


