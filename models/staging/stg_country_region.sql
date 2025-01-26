with
    countryregion as (
        select
            cast(countryregioncode as varchar) as pk_country_region_code
            , name as country
        from {{ source('sap_adw', 'countryregion') }}
    )

select *
from countryregion
