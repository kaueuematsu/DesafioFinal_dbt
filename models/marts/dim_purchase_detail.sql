with 
    purchase_detail as (
        select
            *
        from {{ref('stg_purchase_detail')}}
    )

    , stg_product as (
        select
            *
        from {{ref('stg_product')}}
    )

    , dim_purchase_detail as (
        select
            purchase_detail.id_purchase_order_detail as pk_purchase_detail
            , purchase_detail.id_purchase_order
            , purchase_detail.order_qty
            , purchase_detail.id_product
            , purchase_detail.unit_price
            , stg_product.product_name
            , stg_product.category
            , stg_product.sub_category
        from purchase_detail
        left join stg_product on stg_product.pk_product = purchase_detail.id_product
    )

select *
from dim_purchase_detail