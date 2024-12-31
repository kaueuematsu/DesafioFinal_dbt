{{ config(materialized='table') }}

with 
    stateprovince as (
        SELECT
            stateprovinceid as state_province_id
            , stateprovincecode as state_province_code
            , countryregioncode as country_region_code
            , isonlystateprovinceflag as is_only_state_province_flag
            , name as name
            , territoryid as territory_id
            , rowguid as rowgu_id
            , cast(modifieddate as datetime) as modified_date
        FROM {{ source('sap_adw', 'stateprovince') }}
    )

select *
from stateprovince