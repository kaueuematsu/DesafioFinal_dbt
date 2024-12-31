{{ config(materialized='table') }}

with 
    currency as (
        SELECT
            currencycode as currency_code
            , name as name
            , cast(modifieddate as datetime) as modified_date
        FROM {{ source('sap_adw', 'currency') }}
    )

select *
from currency