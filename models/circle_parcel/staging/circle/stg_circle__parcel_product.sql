with 

source as (

    select * from {{ source('circle', 'parcel_product') }}

),

renamed as (

    select
        parcel_id,
        model_mame,
        quantity

    from source
    order by parcel_id

)

select * from renamed
