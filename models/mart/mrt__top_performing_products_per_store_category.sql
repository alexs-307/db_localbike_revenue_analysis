{{
    config(
        materialized = 'table'
    )
}}

WITH product_purchases_per_store_category AS (
    SELECT 
        store_id,
        category_name,
        product_name,
        sum(quantity) as total_items_sold
    FROM {{ ref("int__order_items_enriched") }}
    GROUP BY 1,2,3
    QUALIFY ROW_NUMBER() OVER (
        PARTITION BY store_id, category_name ORDER BY SUM(quantity) DESC
        ) <= 3
)

select * from product_purchases_per_store_category