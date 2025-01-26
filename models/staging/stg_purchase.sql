with
    purchaseorderheader as (
        select 
            cast(purchaseorderid as int) as id_purchase_order
            , cast(orderdate as datetime) as purchase_date
            , cast(subtotal as numeric(18,2)) as subtotal
            , cast(taxamt as numeric(18,2)) as tax
            , cast(freight as numeric(18,2)) freight_cost
            , cast(subtotal as numeric(18,2)) + cast(taxamt as numeric(18,2)) + cast(freight as numeric(18,2)) as total_cost
        from {{ source('sap_adw', 'purchaseorderheader') }}
    )

select *
from purchaseorderheader