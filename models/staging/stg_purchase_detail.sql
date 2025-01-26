with
    purchaseorderdetail as (
        select 
            cast("purchaseorderdetailid" as int) as id_purchase_order_detail
            , cast("purchaseorderid" as int) as id_purchase_order
            , cast("orderqty" as int) as order_qty
            , cast("productid" as int) as id_product
            , cast("unitprice" as numeric(18,2)) as unit_price
        from {{ source('sap_adw', 'purchaseorderdetail') }}
    )

select *
from purchaseorderdetail