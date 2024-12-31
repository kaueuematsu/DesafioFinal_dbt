{{ config(materialized='table') }}

with 
    specialofferproduct as (
        SELECT
            specialofferid as special_offer_id
            , productid as product_id
            , rowguid as rowgu_id
            , cast(modifieddate as datetime) as modified_date
        FROM {{ source('sap_adw', 'specialofferproduct') }}
    )

select *
from specialofferproduct