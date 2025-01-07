with
    salesterritory as (
        select
            cast(territoryid as int) as pk_territory
            , name as name
            , countryregioncode as country_region_code
            , group_ as "group"
            , salesytd as sales_ytd
            , saleslastyear as sales_last_year
            , costytd as cost_ytd
            , costlastyear as cost_last_year
            , rowguid as rowgu_id
            , cast(modifieddate as datetime) as modified_date
        from {{ source('sap_adw', 'salesterritory') }}
    )

select *
from salesterritory
