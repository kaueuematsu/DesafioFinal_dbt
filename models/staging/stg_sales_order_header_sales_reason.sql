with
    salesorderheadersalesreason as (
        select
            cast(salesorderid as int) as fk_sales_order
            , cast(salesreasonid as int) as fk_sales_reason
            , cast(modifieddate as datetime) as modified_date
        from {{ source('sap_adw', 'salesorderheadersalesreason') }}
    )

select *
from salesorderheadersalesreason
