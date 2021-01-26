
    
    



select count(*) as validation_errors
from (

    select
        crop_code

    from "@fab4"."d_crop_types"
    where crop_code is not null
    group by crop_code
    having count(*) > 1

) validation_errors


