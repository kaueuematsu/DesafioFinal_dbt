with 
    stg_sales_order_detail as (
        select 
            *
        from {{ref('stg_sales_order_detail')}}
    )

    , stg_product as (
        select
            *
        from {{ref('stg_product')}}
    )

    , dim_order_detail as (
        select
            stg_sales_order_detail.pk_sales_order_detail
            , stg_sales_order_detail.fk_sales_order
            , stg_sales_order_detail.fk_product
            , stg_sales_order_detail.order_qty
            , stg_sales_order_detail.unit_price
            , stg_sales_order_detail.unit_price_discount
            , stg_product.product_name
            , stg_product.category
            , stg_product.sub_category
        from stg_sales_order_detail
        left join stg_product on stg_product.pk_product = stg_sales_order_detail.fk_product
    )

select *
from dim_order_detail