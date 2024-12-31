{{ config(materialized='table') }}

with 
    productsubcategory as (
        SELECT
            productsubcategoryid as product_subcategory_id
            , productcategoryid as product_category_id
            , name as name
            , rowguid as rowgu_id
            , cast(modifieddate as datetime) as modified_date
        FROM {{ source('sap_adw', 'productsubcategory') }}
    )

select *
from productsubcategory