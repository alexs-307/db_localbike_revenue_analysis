select 
    p.product_id,
    p.product_name,
    p.brand_id,
    b.brand_name,
    p.category_id,
    c.category_name,
    p.model_year,
    p.price_dollars
from {{ ref("stg__products") }} p 
inner join {{ ref("stg__brands") }} b 
    on b.brand_id = p.brand_id 
inner join {{ ref("stg__categories") }} c 
    on p.category_id = c.category_id