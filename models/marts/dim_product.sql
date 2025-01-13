with
    product as (
        select
            pk_product
            , name as product_name
            , fk_product_subcategory
        from {{ ref('stg_product') }}
    )

    , product_subcategory as (
        select
            pk_product_subcategory 
            , fk_product_category 
            , name as subcategory_name
        from {{ref('stg_product_subcategory')}}
    )

    , product_category as (
        select
            pk_product_category 
            , name as category_name
        from {{ref('stg_product_category')}}
    )

    , dim_product as (
        select 
            {{ dbt_utils.generate_surrogate_key(
                    ['pk_product']
                )
            }} as sk_product   
            , product.pk_product
            , product.product_name
            , product_category.category_name
            , product_subcategory.subcategory_name
        from product
        left join product_subcategory on product.fk_product_subcategory = product_subcategory.pk_product_subcategory
        left join product_category on product_subcategory.fk_product_category = product_category.pk_product_category
    )

select *
from dim_product
