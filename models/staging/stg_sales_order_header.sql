with
    salesorderheader as (
        select
            cast(salesorderid as int) as fk_sales_order
            , revisionnumber as revision_number
            , cast(orderdate as datetime) as order_date
            , cast(duedate as datetime) as due_date
            , cast(shipdate as datetime) as ship_date
            , status as status
            , onlineorderflag as online_order_flag
            , purchaseordernumber as purchase_order_number
            , accountnumber as account_number
            , cast(customerid as int) as fk_customer
            , cast(salespersonid as int) as fk_sales_person
            , cast(territoryid as int) as fk_territory
            , cast(billtoaddressid as int) as fk_bill_to_address
            , cast(shiptoaddressid as int) as fk_ship_to_address
            , cast(shipmethodid as int) as fk_ship_method
            , cast(creditcardid as int) as fk_credit_card
            , creditcardapprovalcode as credit_card_approval_code
            , cast(currencyrateid as int) as fk_currency_rate
            , subtotal as subtotal
            , taxamt as tax_amt
            , freight as freight
            , totaldue as total_due
            , comment as comment
            , rowguid as rowgu_id
            , cast(modifieddate as datetime) as modified_date
        from {{ source('sap_adw', 'salesorderheader') }}
    )

select *
from salesorderheader
