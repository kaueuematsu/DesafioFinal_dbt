with
    stg_sales_order_header as (
        select 
            distinct(fk_credit_card)
        from {{ ref('stg_sales_order_header') }}
        where fk_credit_card is not null
    )

    , stg_credit_card as (
        select 
            pk_credit_card
            , card_type
        from {{ ref('stg_credit_card') }}
    )

    , dim_credit_card as (
        select
            {{ dbt_utils.generate_surrogate_key(
                            ['fk_credit_card']
                        )
                    }} as sk_credit_card 
            , stg_sales_order_header.fk_credit_card as id_credit_card
            , stg_credit_card.card_type
            from stg_sales_order_header 
        left join stg_credit_card on stg_sales_order_header.fk_credit_card = stg_credit_card.pk_credit_card
    )

select *
from dim_credit_card
