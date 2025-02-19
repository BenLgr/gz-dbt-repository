select *
from {{ ref('stg_raw__cpg_adwords') }}
union all 
select *
from {{ ref('stg_raw__cpg_bing') }}
union all 
select *
from {{ ref('stg_raw__cpg_criteo') }}
union all 
select *
from {{ ref('stg_raw__cpg_facebook') }}
