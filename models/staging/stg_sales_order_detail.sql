with
    salesorderdetail as (
        select
            cast(salesorderdetailid as int) as pk_sales_order_detail
            , cast(salesorderid as int) as fk_sales_order
            , cast(productid as int) as fk_product
            , cast(orderqty as int) as order_qty
            , cast(unitprice as numeric(18,2)) as unit_price
            , cast(unitpricediscount as numeric(18,2)) as unit_price_discount
        from {{ source('sap_adw', 'salesorderdetail') }}
    )

select *
from salesorderdetail
