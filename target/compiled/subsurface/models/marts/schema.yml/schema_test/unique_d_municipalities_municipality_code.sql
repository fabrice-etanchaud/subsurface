
    
    



select count(*) as validation_errors
from (

    select
        municipality_code

    from "@fab4"."d_municipalities"
    where municipality_code is not null
    group by municipality_code
    having count(*) > 1

) validation_errors


