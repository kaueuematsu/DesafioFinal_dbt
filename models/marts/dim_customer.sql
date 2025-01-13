with
    person as (
        select
            pk_person
            , full_name
        from {{ ref('stg_person') }}
    )

    , store as (
        select
            pk_store
            , name
        from {{ ref('stg_store') }}
    )

    , customer as (
        select 
            pk_customer
            , fk_person
            , fk_store
        from {{ ref('stg_customer') }}
    )

    , first_order as (
        select
            sales_order_header.fk_customer,
            min(sales_order_header.order_date) as first_order_date
        from {{ ref('stg_sales_order_header') }} as sales_order_header
        group by sales_order_header.fk_customer
    )

    , joined as (
            select
                customer.pk_customer
                , customer.fk_person
                , person.full_name
                , customer.fk_store
                , store.name
                , first_order.first_order_date
            from customer
            left join person on person.pk_person = customer.pk_customer
            left join store on store.pk_store = customer.fk_store
            left join first_order on customer.pk_customer = first_order.fk_customer
    )

    , dim_customer as (
        select
            {{ dbt_utils.generate_surrogate_key(
                        ['pk_customer']
                    )
                }} as sk_customer
            , pk_customer
            , full_name
            , name as store_name
            , first_order_date
        from joined
    )

select *
from dim_customer
