with 
    purchase as (
        select
            *
        from {{ref('stg_purchase')}}
    )

    , fct_purchase as (
        select
            id_purchase_order as pk_purchase
            , purchase_date
            , subtotal
            , tax
            , freight_cost
            , total_cost
        from purchase
    )

select *
from fct_purchase