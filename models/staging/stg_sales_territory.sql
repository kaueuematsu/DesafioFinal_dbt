with
    salesterritory as (
        select
            cast(territoryid as int) as pk_territory
            , name as territory_name
            , cast(countryregioncode as varchar) as fk_country_region
            , salesytd as sales_ytd
            , saleslastyear as sales_last_year
            , group_ as region_division
            , costytd as cost_ytd
            , costlastyear as cost_last_year
        from {{ source('sap_adw', 'salesterritory') }}
    )

select *
from salesterritory
