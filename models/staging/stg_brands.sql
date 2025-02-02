select 
    brand_id,
    brand_name 
from {{ source("databird_final_project",'brands') }}