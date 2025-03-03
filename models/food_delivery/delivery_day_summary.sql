
select 
    order_date,
    sum(order_total_paid) as paid,
    sum(order_total_fees) as fees,
    COUNT(id_order) as nb_orders
    
from {{ ref('stg_fd_delivery__delivery') }}
group by order_date
order by order_date
