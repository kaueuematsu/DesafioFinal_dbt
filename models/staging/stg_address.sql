{{ config(materialized='table') }}

with 
    address as (
        SELECT
            addressid as address_id
            , addressline1 as address_line1
            , addressline2 as address_line2
            , city as city
            , stateprovinceid as state_province_id
            , postalcode as postalcode
            , spatiallocation as spatial_location
            , rowguid as rowgu_id
            , cast(modifieddate as datetime) as modified_date
        FROM {{ source('sap_adw', 'address') }}
    )

select *
from address