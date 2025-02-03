select 
    staff_id,
    active,
    store_id,
    NULLIF(manager_id,"NULL") as manager_id
from {{ source("databird_final_project",'staffs') }}