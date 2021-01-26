
    
    



select count(*) as validation_errors
from "@fab4"."stg__land_values"
where transaction_date is null


