{{
    config(
        alias = 'mrt__revenues_per_store_category',
        materialized = 'table'
    )
}}

with grouped_table as (
    select 
        store_id,
        category_id,
        sum(total_order_value_dollars) as total_revenue_dollars,
        sum(total_order_value_wo_discounts_dollars) as total_revenue_pre_discount_dollars,
        count(distinct order_id) as cnt_orders,
        sum(total_item_quantity) as total_items_sold,
        avg(total_order_value_dollars) as avg_basket_dollars_per_seller,
        avg(total_item_quantity) as avg_items_per_basket_per_seller
    from {{ ref("int__order_financial_metrics") }}
    group by store_id, category_id
)

select 
    gt.store_id,
    gt.category_id,
    total_revenue_dollars,
    total_revenue_pre_discount_dollars,
    cnt_orders,
    total_items_sold,
    avg_basket_dollars_per_seller,
    avg_items_per_basket_per_seller,
    si.cnt_sellers,
    si.cnt_managers,
    si.cnt_sellers / si.cnt_managers as ratio_seller_per_manager,
    1.* total_revenue_dollars / cnt_sellers as revenue_dollars_per_seller
from grouped_table gt
left join {{ ref("int__staff_info_per_store") }} si 
    on si.store_id = gt.store_id