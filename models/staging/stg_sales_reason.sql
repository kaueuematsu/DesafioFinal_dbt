with
    salesorderheadersalesreason as (
        select
            cast(salesorderid as int) as pk_sales_order_reason
            , cast(salesreasonid as int) as id_sales_reason
        from {{ source('sap_adw', 'salesorderheadersalesreason') }}
    )

    , salesreason as (
        select
            cast(salesreasonid as int) as id_sales_reason
            , cast(name as varchar) as sales_reason
            , cast(reasontype as varchar) as reason_type
        from {{ source('sap_adw', 'salesreason') }}
    )

    , stg_sales_reason as (
        select
            salesorderheadersalesreason.pk_sales_order_reason
            , salesreason.sales_reason
            , salesreason.reason_type
        from salesorderheadersalesreason
        left join salesreason on salesreason.id_sales_reason = salesorderheadersalesreason.id_sales_reason

    )

select *
from stg_sales_reason
