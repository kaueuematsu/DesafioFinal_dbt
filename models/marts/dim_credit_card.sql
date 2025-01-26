with
    stg_credit_card as (
        select 
            *
        from {{ ref('stg_credit_card') }}
    )

    , dim_credit_card as (
        select
            pk_credit_card
            , card_type
            , card_number
        from stg_credit_card
    )

select *
from dim_credit_card
