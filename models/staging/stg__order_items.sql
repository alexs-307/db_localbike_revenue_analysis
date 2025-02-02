select 
    CONCAT(order_id,'_',product_id) as order_item_id,
    order_id,
    item_id,
    product_id,
    quantity,
    list_price as price_dollars,
    discount as discount_pct,
    CASE WHEN discount > 0 THEN 1 ELSE 0 END has_discount 
from {{ source("databird_final_project",'order_items') }}