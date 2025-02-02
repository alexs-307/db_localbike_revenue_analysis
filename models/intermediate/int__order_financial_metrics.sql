select 
    order_id,
    staff_id,
    store_id,
    category_id,
    order_date,
    COUNT(DISTINCT product_id) as cnt_distinct_products,
    COUNT(product_id) as cnt_products,
    COUNT(DISTINCT category_id) as cnt_distinct_categories,
    SUM(quantity) as total_item_quantity,
    SUM(quantity * price_dollars * (1-discount_pct)) as total_order_value_dollars,
    SUM(quantity * price_dollars) as total_order_value_wo_discounts_dollars,
    SUM(quantity * price_dollars * discount_pct) as total_discounts_dollars,
    SUM(CASE WHEN has_discount = 1 THEN quantity END) as cnt_items_sold_discounted
from {{ ref("int__order_items_enriched") }}
group by order_id, staff_id, store_id, category_id, order_date