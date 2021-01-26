

select
  "Valeur fonciere" as amount
  ,"Code departement" as departement
  ,"Code commune" as code_commune
from
  "fs"."valeurs_foncieres"
where
  "Code departement" = '79'