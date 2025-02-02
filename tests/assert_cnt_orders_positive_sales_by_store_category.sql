select 
   *
from {{ ref("mrt__revenues_per_store_seller_category")}}
where cnt_orders <= 0