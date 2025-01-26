with 
    sales_order_header as (
        select
            pk_sales_order
            , fk_customer
            , fk_sales_person
            , fk_territory
            , fk_credit_card
            , fk_shipment
            , order_date
            , ship_date
            , order_status
            , subtotal
            , tax_amt
            , freight
            , online_order
        from {{ref('stg_sales_order_header')}}
    )

    , order_detail as (
        select
            pk_sales_order_detail
            , fk_sales_order
            , fk_product
            , order_qty
            , unit_price
            , unit_price_discount
        from {{ref('stg_sales_order_detail')}}
    )

    , product as (
        select
           pk_product
           , product_name
           , category
           , sub_category
        from {{ref('stg_product')}}
    )

    , joined as (
        select
            sales_order_header.*
            , order_detail.*
            , product.*
        from sales_order_header
        left join order_detail on order_detail.fk_sales_order = sales_order_header.pk_sales_order
        left join product on order_detail.fk_product = product.pk_product
    )

    , calcs as (
        select
            *
            , unit_price * (1 - unit_price_discount) * order_qty as net_total
            , unit_price * order_qty as gross_total
        from joined
    )

    , sk as (
        select
            {{ dbt_utils.generate_surrogate_key(
                    ['pk_sales_order', 'fk_product']
                )
            }} as sk_int_order
            , *
        from calcs
    )


    , columns as (
        select
            sk_int_order
            , pk_sales_order
            , pk_sales_order_detail
            , fk_customer
            , fk_product
            , fk_sales_person
            , fk_territory
            , fk_shipment
            , fk_credit_card
            , order_date
            , ship_date
            , product_name
            , category
            , sub_category
            , order_qty
            , online_order
            , unit_price
            , unit_price_discount
            , net_total
            , gross_total
        from sk
    )

select *
from columns