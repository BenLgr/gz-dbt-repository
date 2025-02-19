/*select *
from {{ ref('stg_raw__cpg_adwords') }}
union all 
select *
from {{ ref('stg_raw__cpg_bing') }}
union all 
select *
from {{ ref('stg_raw__cpg_criteo') }}
union all 
select *
from {{ ref('stg_raw__cpg_facebook') }}*/

/* example with source 
{{ dbt_utils.union_relations(
    relations=[
        source('raw', 'cpg_adwords'),
        source('raw', 'cpg_bing'),
        source('raw', 'cpg_criteo'),
        source('raw', 'cpg_facebook')
    ]
) }} */
{{ dbt_utils.union_relations(
    relations=[
        ref('stg_raw__cpg_adwords'),
        ref('stg_raw__cpg_bing'),
        ref('stg_raw__cpg_criteo'),
        ref('stg_raw__cpg_facebook')
    ]
) }} 