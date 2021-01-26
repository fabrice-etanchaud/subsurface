
    
    



select count(*) as validation_errors
from "@fab4"."stg__municipalities"
where departement_label is null


