{% snapshot products_snapshot %}

{{
    config(
      target_schema='dbt_snapshots', 
      unique_key='products_id', 
      strategy='check', 
      check_cols='all'
    )
}}
select * from {{ ref('stg_raw__product') }}
--select * from {{ source('raw','product') }}

-- target_schema    corresponding to the new database in BigQuery
-- unique_key       unique key of the table to track
-- strategy         other strategy
-- check_cols       track evolution on all columns

{% endsnapshot %}