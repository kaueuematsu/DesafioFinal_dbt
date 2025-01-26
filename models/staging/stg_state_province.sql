with 
    stateprovince as (
        select
            cast(stateprovinceid as int) as pk_state_province
            , cast(stateprovincecode as varchar) as id_state_province
            , cast(countryregioncode as varchar) as fk_country_region
            , name as state_name
            , cast(territoryid as varchar) as fk_territory
        from {{ source('sap_adw', 'stateprovince') }}
    )

select *
from stateprovince
