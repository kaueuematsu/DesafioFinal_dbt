with
    salesorderheader as (
        select 
            *
        from {{ref('stg_sales_order_header')}}
    )

    , fct_sales as ( -- A staging já possuia algumas colunas com fks das dimensões, não foi preciso chamar todas.
        select
            salesorderheader.pk_sales_order
            , salesorderheader.fk_customer
            , salesorderheader.fk_sales_person
            , salesorderheader.fk_territory
            , salesorderheader.fk_shipment
            , salesorderheader.fk_credit_card
            , salesorderheader.order_date
            , salesorderheader.ship_date
            , salesorderheader.order_status
            , salesorderheader.subtotal
            , salesorderheader.tax_amt
            , salesorderheader.freight
            , salesorderheader.total_due
            , salesorderheader.online_order
        from salesorderheader

    )

select *
from fct_sales