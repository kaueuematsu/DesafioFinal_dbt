with
    salesreason as (
        select
            cast(salesreasonid as int) as pk_sales_reason
            , name as name
            , reasontype as reason_type
            , cast(modifieddate as datetime) as modified_date
        from {{ source('sap_adw', 'salesreason') }}
    )

select *
from salesreason
