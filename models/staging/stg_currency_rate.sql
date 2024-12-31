{{ config(materialized='table') }}

with 
    currencyrate as (
        SELECT
            currencyrateid as currency_rate_id
            , cast(currencyratedate as datetime) as currency_rate_date
            , fromcurrencycode as from_currency_code
            , tocurrencycode as to_currency_code
            , averagerate as average_rate
            , endofdayrate as end_of_day_rate
            , cast(modifieddate as datetime) as modified_date
        FROM {{ source('sap_adw', 'currencyrate') }}
    )

select *
from currencyrate