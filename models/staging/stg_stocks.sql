select 
    store_id,
    product_id,
    quantity 
from {{ source("databird_final_project",'stocks') }}