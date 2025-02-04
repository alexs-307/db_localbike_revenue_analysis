select 
    oi.order_item_id,
    oi.order_id,
    oi.product_id,
    p.product_name,
    p.category_id,
    p.model_year,
    p.brand_id,
    p.brand_name,
    p.category_name,
    oi.quantity,
    oi.price_dollars,
    oi.discount_pct,
    oi.has_discount,
    o.customer_id,
    o.staff_id,
    o.store_id,
    s.store_name,
    o.order_status,
    o.order_date,
    o.required_date,
    o.shipped_date
from {{ ref("stg__order_items")}} oi
inner join {{ ref("stg__orders" )}} o
    on o.order_id = oi.order_id
inner join {{ ref("int__products_enriched")}} p 
    on p.product_id = oi.product_id
inner join {{ ref("stg__stores")}} s 
    on s.store_id = o.store_id