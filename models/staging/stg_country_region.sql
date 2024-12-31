{{ config(materialized='table') }}

with 
    countryregion as (
        SELECT
            countryregioncode as country_region_code
            , name as name
            , cast(modifieddate as datetime) as modified_date
        FROM {{ source('sap_adw', 'countryregion') }}
    )

select *
from countryregion