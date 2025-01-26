with
    person as (
        select
           *
        from {{ ref('stg_person') }}
        where person_type = 'Sales Person'
    )

    , sales_person as (
        select
            *
        from {{ ref('stg_sales_person') }}
    )
    
    , sales_calculations as (
        select
            int_order.fk_sales_person
            , sum(order_qty) as orders_total
            , cast(sum((unit_price * (1 - unit_price_discount))) as numeric(18,2)) as sales_total
            , cast(sum(unit_price * order_qty) - sum((unit_price * (1 - unit_price_discount))) as numeric(18,2)) as discount_total
            , cast(count(distinct pk_sales_order) as int) as qt_orders_total
            , cast(count(distinct fk_customer) as int) as customer_total
            , cast(round(avg(net_total), 2) as numeric(18,2)) as order_average
        from {{ ref('int_order') }} as int_order
    group by int_order.fk_sales_person
)

select
    sales_person.id_sales_person
    , sales_person.id_territory
    , person.full_name
    , sales_person.sales_quota
    , sales_person.sales_ytd
    , sales_calculations.orders_total
    , sales_calculations.sales_total
    , sales_calculations.discount_total    
    , sales_calculations.qt_orders_total
    , sales_calculations.customer_total
    , sales_calculations.order_average
    , case
        when sales_calculations.sales_total >= sales_person.sales_quota then 'Sales Target Achieved'
        else 'Sales Target NOT Achieved'
      end as quota_status
from
    sales_person
left join
    sales_calculations on sales_person.id_sales_person = sales_calculations.fk_sales_person
left join
    person on sales_person.id_sales_person = person.id_person