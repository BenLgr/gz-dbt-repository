with  nb_products_in_parcel as(
    select 
        parcel_id
        ,SUM(quantity) AS quantity_in_parcel
        ,COUNT(DISTINCT model_mame) AS nb_products
    from {{ ref('stg_circle__parcel_product') }}
    group by parcel_id
)
, cirle_parcel_status as (
    select
        *
        ,case
            when date_cancelled IS NOT NULL THEN 'Cancelled'
            when date_shipping IS NULL THEN 'In Progress'
            when date_delivery IS NULL THEN 'In Transit'
            when date_delivery IS NOT NULL THEN 'Delivered'
            else NULL
        end as status
    from {{ ref('stg_circle__parcel') }}
    left join nb_products_in_parcel
    using (parcel_id)
)
select 
    *
    -- time --
    ,DATE_DIFF(date_shipping, date_purchase, DAY) AS expedition_time
    ,DATE_DIFF(date_delivery, date_shipping, DAY) AS transport_time
    ,DATE_DIFF(date_delivery, date_purchase, DAY) AS delivery_time
    -- delay
    ,IF(date_delivery is null, null, IF(DATE_DIFF(date_delivery, date_purchase, DAY)>5,1,0)) AS delay
from cirle_parcel_status
