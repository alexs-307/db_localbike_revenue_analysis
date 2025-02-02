select 
    price_dollars
from {{ ref("stg__produts") }}
where price_dollars < 0