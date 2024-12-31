{{ config(materialized='table') }}

with 
    salesorderheader as (
        SELECT
            salesorderid as sales_order_id
            , revisionnumber as revision_number
            , cast(orderdate as datetime) as order_date
            , cast(duedate as datetime) as due_date
            , cast(shipdate as datetime) as ship_date
            , status as status
            , onlineorderflag as online_order_flag
            , purchaseordernumber as purchase_order_number
            , accountnumber as account_number
            , customerid as customer_id
            , salespersonid as sales_person_id
            , territoryid as territory_id
            , billtoaddressid as bill_to_address_id
            , shiptoaddressid as ship_to_address_id
            , shipmethodid as ship_method_id
            , creditcardid as credit_card_id
            , creditcardapprovalcode as credit_card_approval_code
            , currencyrateid as currency_rate_id
            , subtotal as subtotal
            , taxamt as tax_amt
            , freight as freight
            , totaldue as total_due
            , comment as comment
            , rowguid as rowgu_id
            , cast(modifieddate as datetime) as modified_date
        FROM {{ source('sap_adw', 'salesorderheader') }}
    )

select *
from salesorderheader