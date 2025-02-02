select 
   order_date,
   store_id
from {{ ref("mrt__daily_revenues_per_store_seller_category")}}
group by order_date, store_id
having sum(total_items_sold) <= 0