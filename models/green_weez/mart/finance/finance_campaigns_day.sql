select 
    fd.*
    ,ads_cost
    ,ads_impressions
    ,ads_clicks
    ,operational_margin - ads_cost as ads_margin
from {{ ref('finance_days') }} as fd
join {{ ref('int_campaign_day') }} as cd
using(date_date)