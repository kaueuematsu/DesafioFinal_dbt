with
    salesperson as (
        select
            cast(businessentityid as int) as id_sales_person
            , cast(territoryid as int) as id_territory
            , cast(salesquota / 100 as numeric(18,2)) as sales_quota
            , cast(bonus as numeric(18,2)) as bonus
            , cast(commissionpct / 100 as numeric(18,2)) as commission_pct
            , cast(salesytd / 100 as numeric(18,2)) as sales_ytd
            , cast(saleslastyear / 100 as numeric(18,2)) as sales_last_year   
        from {{ source('sap_adw', 'salesperson') }}
    )
    
select *
from salesperson
