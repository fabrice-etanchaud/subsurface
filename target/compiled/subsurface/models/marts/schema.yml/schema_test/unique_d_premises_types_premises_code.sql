
    
    



select count(*) as validation_errors
from (

    select
        premises_code

    from "@fab4"."d_premises_types"
    where premises_code is not null
    group by premises_code
    having count(*) > 1

) validation_errors


