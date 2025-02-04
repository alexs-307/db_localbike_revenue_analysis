select 
    price_dollars
from {{ ref("stg__order_items") }}
where price_dollars < 0