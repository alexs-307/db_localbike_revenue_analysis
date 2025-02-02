select 
    order_id,
    SUM(quantity * price_dollars * (1-discount_pct)) as total_order_value_dollars,
    SUM(quantity * price_dollars) as total_order_value_wo_discounts_dollars,
    SUM(quantity * price_dollars * discount_pct) as total_discounts_dollars
from {{ ref("int__order_items_enriched") }}
group by order_id