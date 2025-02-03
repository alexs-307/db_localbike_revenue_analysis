select 
    store_id,
    count(distinct staff_id) as cnt_sellers,
    count(distinct manager_id) as cnt_managers
from {{ ref("stg__staffs") }}
where 1=1 
and active = 1
group by store_id