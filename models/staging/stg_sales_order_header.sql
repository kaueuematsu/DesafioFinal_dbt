with
    salesorderheader as (
        select
            cast(salesorderid as int) as pk_sales_order
            , cast(customerid as int) as fk_customer
            , cast(salespersonid as int) as fk_sales_person
            , cast(territoryid as int) as fk_territory
            , cast(orderdate as date) as order_date
            , cast(shiptoaddressid as int) as fk_shipment
            , cast(creditcardid as int) as fk_credit_card
            , cast(shipdate as date) as ship_date
            , status as order_status
            , cast(purchaseordernumber as varchar) as purchase_order_number
            , cast(shipmethodid as int) as id_ship_method
            , cast(subtotal as numeric(18,2)) as subtotal
            , cast(taxamt as numeric(18,2)) as tax_amt
            , cast(freight as numeric(18,2)) as freight
            , cast(totaldue as numeric(18,2)) as  total_due
        , case
            when onlineorderflag = True then 'Online'
            else 'Offline'
            end as online_order
        from {{ source('sap_adw', 'salesorderheader') }}
    )

select *
from salesorderheader
