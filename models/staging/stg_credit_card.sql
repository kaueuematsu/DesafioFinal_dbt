{{ config(materialized='table') }}

with 
    creditcard as (
        SELECT
            creditcardid as credit_card_id
            , cardtype as card_type
            , cardnumber as card_number
            , expmonth as exp_month
            , expyear as exp_year
          , cast(modifieddate as datetime) as modified_date
        FROM {{ source('sap_adw', 'creditcard') }}
    )

select *
from creditcard