{{ config(materialized='table') }}

with 
    specialoffer as (
        SELECT
            specialofferid as special_offer_id
            , description as description
            , discountpct as discount_pct
            , type as type
            , category as category
            , cast(startdate as datetime) as start_date
            , cast(enddate as datetime) as end_of_day_rate
            , minqty as min_qty
            , maxqty as max_qty
            , rowguid as rowgu_id
            , cast(modifieddate as datetime) as modified_date
        FROM {{ source('sap_adw', 'specialoffer') }}
    )

select *
from specialoffer