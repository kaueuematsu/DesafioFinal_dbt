with
    product as (
        select
            cast(productid as int) as pk_product
            , cast(productsubcategoryid as int) as id_product_subcategory
            , name as product_name
            , productnumber as product_number
        from {{ source('sap_adw', 'product') }}
    )

    , product_subcategory as (
        select
            cast(productsubcategoryid as int) as id_product_subcategory
            , cast(productcategoryid as int) as id_product_category
            , cast(name as varchar) as sub_category
        from {{ source('sap_adw', 'productsubcategory') }}
    )

    , product_category as (
        select
           cast(productcategoryid as int) as id_product_category
           , cast(name as varchar) as category
        from {{ source('sap_adw', 'productcategory') }}
    )

    , stg_product as (
        select  
            product.pk_product
            , product.product_name
            , product_category.category
            , product_subcategory.sub_category
        from product
        left join product_subcategory on product.id_product_subcategory = product_subcategory.id_product_subcategory
        left join product_category on product_subcategory.id_product_category = product_category.id_product_category
    )

select *
from stg_product
