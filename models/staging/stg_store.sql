with
    store as (
        select
            cast(businessentityid as varchar) as pk_store         
            , cast(salespersonid as int) as fk_sales_person
            , name as name
            , demographics as demographics
            , rowguid as rowgu_id
            , cast(modifieddate as datetime) as modified_date
        from {{ source('sap_adw', 'store') }}
    )

select *
from store
