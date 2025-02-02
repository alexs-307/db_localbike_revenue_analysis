select 
    order_date as dt,
    store_id,
    sum(total_order_value_dollars) as total_revenue_dollars,
    sum(total_order_value_wo_discounts_dollars) as total_revenue_pre_discount_dollars,
    count(distinct order_id) as cnt_orders,
    avg(total_order_value_dollars) as avg_basket_dollars,
    avg(total_item_quantity) as avg_items_per_basket
from {{ ref("int__order_financial_metrics") }}
group by dt, store_id