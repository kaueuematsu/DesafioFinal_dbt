with
    stg_sales_order_header_sales_reason as (
        select 
            fk_sales_order
            , fk_sales_reason
        from {{ ref('stg_sales_order_header_sales_reason') }}
    )

    , stg_sales_reason as (
        select
            pk_sales_reason
            , name
            , reason_type
        from {{ ref('stg_sales_reason') }}
    )

    , reason_order_id as (
        select 
            stg_sales_order_header_sales_reason.fk_sales_order as id_sales_order
            , stg_sales_reason.name as sales_reason
        from stg_sales_order_header_sales_reason
        left join stg_sales_reason on stg_sales_order_header_sales_reason.fk_sales_reason = stg_sales_reason.pk_sales_reason
    )

    , dim_order as (
        select
            {{ dbt_utils.generate_surrogate_key(
                        ['id_sales_order']
                    )
                }} as sk_sales_order
            , id_sales_order
            , listagg(sales_reason, ', ') within group (order by sales_reason asc) as agg_sales_reason
        from reason_order_id
        group by id_sales_order
    )

select *
from dim_order
