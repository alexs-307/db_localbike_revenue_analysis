select 
    CONCAT(order_id,'_',product_id) as order_item_id,
    order_id,
    item_id,
    product_id,
    quantity,
    list_price as price_dollars,
    discount as discount_pct
from {{ source("databird_final_project",'order_items') }}