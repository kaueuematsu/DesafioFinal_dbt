with
    productsubcategory as (
        select
            cast(productsubcategoryid as int) as pk_product_subcategory
            , cast(productcategoryid as int) as fk_product_category
            , name as name
            , rowguid as rowgu_id
            , cast(modifieddate as datetime) as modified_date
        from {{ source('sap_adw', 'productsubcategory') }}
    )

select *
from productsubcategory
