select 
    staff_id,
    active,
    store_id,
    manager_id
from {{ source("databird_final_project",'staffs') }}