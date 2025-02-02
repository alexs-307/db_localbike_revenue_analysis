select 
    product_id,
    product_name,
    brand_id,
    category_id,
    model_year,
    list_price as price_dollars
from {{ source("databird_final_project",'products') }}