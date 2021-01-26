
    
    



select count(*) as validation_errors
from "@fab4"."stg__municipalities"
where municipality_label is null


