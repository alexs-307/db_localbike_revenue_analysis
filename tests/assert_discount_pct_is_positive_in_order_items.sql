select 
    discount_pct
from {{ ref("stg__order_items") }}
where discount_pct < 0