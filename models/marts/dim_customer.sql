with
    customer as (
        select 
           *
        from {{ ref('stg_customer') }}
    )

    , person as (
        select
            *
        from {{ ref('stg_person') }}
    )

    , store as (
        select
           *
        from {{ ref('stg_store') }}
    )

    , dim_customer as (
        select
            customer.pk_customer
            , person.id_person
            , person.full_name
            , person.person_type
            , person.total_purchase_ytd
            , store.pk_store as id_store
            , case
                when store.store_name is null then 'Unknown'
                else store.store_name
              end as store_name
            , person.email_promotion
            , customer.fk_territory as id_territory
        from customer
        left join person on person.id_person = customer.fk_person
        left join store on store.pk_store = customer.fk_store
    )

select *
from dim_customer
