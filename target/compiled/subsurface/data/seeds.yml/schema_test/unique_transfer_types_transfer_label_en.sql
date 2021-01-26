
    
    



select count(*) as validation_errors
from (

    select
        transfer_label_en

    from "@fab4"."transfer_types"
    where transfer_label_en is not null
    group by transfer_label_en
    having count(*) > 1

) validation_errors


