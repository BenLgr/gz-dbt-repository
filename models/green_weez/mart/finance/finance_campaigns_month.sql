select 
    extract(MONTH FROM date_date) as month
    ,sum(nb_of_orders) as nb_of_orders
    ,sum(tot_revenue) as tot_revenue
    ,avg(avg_basket) as avg_basket
    ,sum(operational_margin) as operational_margin
    ,sum(tot_purchase_cost) as tot_purchase_cost
    ,sum(tot_quantity) as tot_quantity
    ,sum(ads_cost) as ads_cost
    ,sum(ads_impressions) as ads_impressions
    ,sum(ads_clicks) as ads_clicks
    ,sum(ads_margin) as ads_margin
from {{ ref('finance_campaigns_day') }}
group by month 
order by month