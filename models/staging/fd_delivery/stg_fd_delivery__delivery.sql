with 

source as (

    select * from {{ source('fd_delivery', 'delivery') }}

),

renamed as (

    select
        id_order,
        order_date,
        order_time,
        merchant_name,
        order_total_promo,
        order_currency,
        order_delivery_fee,
        order_total_fees,
        order_processing_fee,
        payment_method_name,
        seller_category_name,
        order_total_paid,
        order_item_delivery_address_city,
        order_item_delivery_address_subregion,
        order_item_delivery_address_region,
        seller_name,
        random_id,
        customer_gender

    from source
    order by order_date, order_time

)

select * from renamed
