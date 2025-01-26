with 
    creditcard as (
        select
            cast(creditcardid as int) as pk_credit_card
            , cardtype as card_type
            , cardnumber as card_number
        from {{ source('sap_adw', 'creditcard') }}
    )

select *
from creditcard
