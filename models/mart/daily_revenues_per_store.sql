select 
    order_date as dt,
    store_id,
    sum(total_order_value_dollars) as total_revenue_dollars,
    sum(total_order_value_wo_discounts_dollars) as total_revenue_pre_discount_dollars
from {{ ref("int__order_financial_metrics") }}
group by dt, store_id