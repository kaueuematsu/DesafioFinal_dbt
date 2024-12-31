{{ config(materialized='table') }}

with 
    product as (
        SELECT
            productid as product_id
            , name as name
            , productnumber as product_number
            , makeflag as make_flag
            , finishedgoodsflag as finished_goods_flag
            , color as color
            , safetystocklevel as safety_stock_level
            , reorderpoint as reorder_point
            , standardcost as standard_cost
            , listprice as list_price
            , size as size
            , sizeunitmeasurecode as size_unit_measure_code
            , weightunitmeasurecode as weight_unit_measure_code
            , weight as weight
            , daystomanufacture as days_to_manufacture
            , productline as product_line
            , class as class
            , style as style
            , productsubcategoryid as product_subcategory_id
            , productmodelid as product_model_id
            , cast(sellstartdate as datetime) as sell_start_date
            , cast(sellenddate as datetime) as sell_end_date
            , cast(discontinueddate as datetime) as discontinued_date
            , rowguid as rowgu_id
            , cast(modifieddate as datetime) as modified_date
        FROM {{ source('sap_adw', 'product') }}
    )

select *
from product