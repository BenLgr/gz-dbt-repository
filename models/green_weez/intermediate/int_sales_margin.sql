with tab as (
    select 
        date_date
        ,orders_id
        ,products_id
        ,quantity
        ,revenue
        ,purchase_price * quantity as purchase_cost
    from {{ ref('stg_raw__sales') }}
    left join {{ ref('stg_raw__product') }}
    using (products_id)
)
select 
    *
    ,revenue - purchase_cost as margin 
    ,{{ margin_percent('revenue', 'purchase_cost') }} AS margin_percent
from tab