select
    orders_id
    ,date_date
    ,SUM(revenue) as revenue
    ,SUM(quantity) as quantity
    ,SUM(purchase_cost) as purchase_cost
    ,SUM(margin) as margin
from {{ ref('int_sales_margin') }}
-- where orders_id in (1002561,1002560,1002559) -used for comparing results
group by orders_id, date_date
order by orders_id