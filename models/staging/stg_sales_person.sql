with
    salesperson as (
        select
            cast(businessentityid as int) as pk_sales_person
            , cast(territoryid as int) as fk_territory
            , cast(salesquota as numeric(18,2)) as sales_quota
            , cast(bonus as numeric(18,2)) as bonus
            , cast(commissionpct as numeric(18,2)) as commission_pct
            , cast(salesytd as numeric(18,2)) as sales_ytd
            , cast(saleslastyear as numeric(18,2)) as sales_last_year
            , rowguid as rowgu_id
            , cast(modifieddate as datetime) as modified_date          
        from {{ source('sap_adw', 'salesperson') }}
    )
    
select *
from salesperson
