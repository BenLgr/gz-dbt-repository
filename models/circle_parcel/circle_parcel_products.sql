select
    *
from {{ ref('stg_circle__parcel_product') }} as pp
join {{ ref('circle_parcel') }} as p
using (parcel_id)
order by parcel_id