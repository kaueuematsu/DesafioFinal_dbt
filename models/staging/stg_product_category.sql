with
    productcategory as (
        select
            cast(productcategoryid as int) as pk_product_category
            , name as name
            , rowguid as rowgu_id
            , cast(modifieddate as datetime) as modified_date
        from {{ source('sap_adw', 'productcategory') }}
    )

select *
from productcategory
