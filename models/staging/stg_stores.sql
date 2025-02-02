select 
    store_id,
    store_name,
    email,
    street,
    city,
    state,
    zip_code
from {{ source("databird_final_project",'stores') }}