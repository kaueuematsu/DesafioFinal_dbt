with
    territory as (
        select *
        from {{ref('stg_sales_territory')}}
    )

     , state_province as (
        select *
        from {{ref('stg_state_province')}}
    )

    , country_region as (
        select *
        from {{ref('stg_country_region')}}
    )

    , sales as (
        select *
        from {{ ref('stg_sales_order_header') }}
    )

    , order_detail as (
        select *
        from {{ ref('stg_sales_order_detail') }}
    )   

    , joined as (
        select 
            distinct sales.pk_sales_order
            , territory.pk_territory
            , order_detail.fk_product
            , sales.order_status
            , territory.territory_name
            , country_region.country
            , order_detail.order_qty
            , order_detail.unit_price
        from sales
        inner join order_detail on order_detail.fk_sales_order = sales.pk_sales_order
        inner join territory on sales.fk_territory = territory.pk_territory
        inner join state_province on territory.pk_territory = state_province.fk_territory
        inner join country_region on state_province.fk_country_region = country_region.pk_country_region_code
        where order_status in (2,5) -- Only orders approved or sent
    )

    , calculations as (
        select
            pk_territory
            , pk_sales_order
            , territory_name
            , country
            , count(distinct pk_sales_order) as total_orders
            , cast(sum(order_qty * unit_price) as numeric(18,2)) as total_sales 
        from joined
        group by         
            pk_territory
            , pk_sales_order
            , territory_name
            , country
    )
     
select * 
from calculations