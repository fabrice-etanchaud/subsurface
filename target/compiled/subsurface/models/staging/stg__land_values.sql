select
  cast(regexp_replace(nullif("Date mutation", ''), '([0-9]{2})/([0-9]{2})/([0-9]{4})', '$3-$2-$1') as date) as transaction_date
  ,cast(replace(nullif("Valeur fonciere", ''), ',', '.') as decimal) as transaction_amount
  ,nullif("Nature mutation", '') as transfer_label_fr
  ,nullif("type de voie", '') as lane_type
  ,lpad(nullif("Code voie", ''), 4, '0') as lane_code
  ,nullif("Voie", '') as lane
  ,lpad(nullif("Code postal", ''), 5, '0') as zip_code
  ,case when "Code departement" not like '97%'
    then lpad(nullif("Code departement", ''), 2, '0') || lpad(nullif("Code commune", ''), 3, '0')
    else lpad(nullif("Code departement", ''), 3, '0') || lpad(nullif("Code commune", ''), 2, '0')
  end as municipality_code
  ,cast(nullif("Nombre de lots", '') as decimal) as lots_count
  ,nullif("code type local", '') as premises_code
  ,cast(nullif("Surface reelle bati", '') as decimal) as built_surface
  ,cast(nullif("Surface terrain", '') as decimal) as land_surface
  ,cast(nullif("Nombre pieces principales", '') as decimal) as main_rooms_count
  ,nullif("Nature culture", '') as crop_code
from
  "subsurface_datalake"."valeurs_foncieres"