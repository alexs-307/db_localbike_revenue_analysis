select 
    customer_id,
    city,
    state, 
    zip_code 
from {{ source("databird_final_project",'customers') }}