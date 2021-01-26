
    
    



select count(*) as validation_errors
from (

    select
        transfer_label_fr

    from "@fab4"."transfer_types"
    where transfer_label_fr is not null
    group by transfer_label_fr
    having count(*) > 1

) validation_errors


