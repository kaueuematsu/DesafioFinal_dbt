{{ config(materialized='table') }}

with 
    productcategory as (
        SELECT
            productcategoryid as product_category_id
            , name as name
            , rowguid as rowgu_id
            , cast(modifieddate as datetime) as modified_date
        FROM {{ source('sap_adw', 'productcategory') }}
    )

select *
from productcategory