select
    om.*
    ,margin + shipping_fee - log_cost - ship_cost as operational_margin
from {{ ref('int_orders_margin') }} as om
join {{ ref('stg_raw__ship') }} as s
using (orders_id)
where orders_id in (1002561,1002560,1002559) --used for comparing results
order by orders_id