select
    date_date
    ,COUNT(orders_id) as nb_of_orders
    ,SUM(revenue) as tot_revenue
    ,SUM(revenue) / COUNT(orders_id) as avg_basket
    ,SUM(operational_margin) as operational_margin
    ,SUM(purchase_cost) as tot_purchase_cost
    ,SUM(quantity) as tot_quantity
from {{ ref('int_orders_operational') }}
group by date_date
order by date_date DESC