with
    salesorderdetail as (
        select
            cast(salesorderid as int) as fk_sales_order
            , cast(salesorderdetailid as int) as fk_sales_order_detail
            , carriertrackingnumber as carrier_tracking_number
            , orderqty as order_qty
            , cast(productid as int) as fk_product
            , cast(specialofferid as int) as fk_special_offer
            , unitprice as unit_price
            , unitpricediscount as unit_price_discount
            , rowguid as rowgu_id
            , cast(modifieddate as datetime) as modified_date
        from {{ source('sap_adw', 'salesorderdetail') }}
    )

select *
from salesorderdetail
