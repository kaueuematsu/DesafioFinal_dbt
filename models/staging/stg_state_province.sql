with 
    stateprovince as (
        select
            cast(stateprovinceid as int) as pk_state_province
            , stateprovincecode as state_province_code
            , cast(countryregioncode as varchar) as fk_country_region_code
            , isonlystateprovinceflag as is_only_state_province_flag
            , name as name
            , cast(territoryid as varchar) as fk_territory
            , rowguid as rowgu_id
            , cast(modifieddate as datetime) as modified_date
        from {{ source('sap_adw', 'stateprovince') }}
    )

select *
from stateprovince
