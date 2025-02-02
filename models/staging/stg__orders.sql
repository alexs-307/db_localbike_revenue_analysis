select 
    order_id,
    customer_id,
    order_status,
    order_date,
    required_date,
    COALESCE(shipped_date,"not_shipped_yet") as shipped_date,
    store_id,
    staff_id 
from {{ source("databird_final_project",'orders') }}