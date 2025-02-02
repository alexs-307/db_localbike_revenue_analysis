select 
    category_id,
    category_name 
from {{ source("databird_final_project",'categories') }}