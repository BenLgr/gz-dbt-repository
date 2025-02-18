select
    *
from {{ ref('stg_circle__parcel_product') }}
join {{ ref('circle_parcel') }}
using (parcel_id)