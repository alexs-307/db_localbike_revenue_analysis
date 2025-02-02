{{
    config(
        alias = 'mrt__daily_revenues_per_store_seller',
        materialized = 'table'
    )
}}

select 
    order_date,
    store_id,
    staff_id,
    category_id,
    sum(total_order_value_dollars) as total_revenue_dollars,
    sum(total_order_value_wo_discounts_dollars) as total_revenue_pre_discount_dollars,
    count(distinct order_id) as cnt_orders,
    sum(total_item_quantity) as total_items_sold,
    avg(total_order_value_dollars) as avg_basket_dollars_per_seller,
    avg(total_item_quantity) as avg_items_per_basket_per_seller
from {{ ref("int__order_financial_metrics") }}
group by order_date, store_id, staff_id, category_id