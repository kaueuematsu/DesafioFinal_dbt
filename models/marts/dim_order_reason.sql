with 
    order_reason as (
        select 
            *
        from {{ref('stg_sales_reason')}}
    )

    , dim_sales_reason as (
        select
            order_reason.pk_sales_order_reason
            , order_reason.sales_reason
            , order_reason.reason_type
        from order_reason

    )
    
select *
from dim_sales_reason