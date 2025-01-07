with 
    creditcard as (
        select
            cast(creditcardid as int) as pk_credit_card
            , cardtype as card_type
            , cardnumber as card_number
            , expmonth as exp_month
            , expyear as exp_year
          , cast(modifieddate as datetime) as modified_date
        from {{ source('sap_adw', 'creditcard') }}
    )

select *
from creditcard
