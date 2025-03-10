with 

source as (

    select * from {{ source('raw', 'cpg_adwords') }}

),

renamed as (

    select
        date_date,
        paid_source,
        campaign_key,
        campgn_name as campaign_name,
        cast (ads_cost as FLOAT64) as ads_cost,
        impression,
        click

    from source

)

select * from renamed
