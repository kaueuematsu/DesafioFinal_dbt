with
    currency as (
        select
            cast(currencycode as varchar) as pk_currency_code
            , name as name
            , cast(modifieddate as datetime) as modified_date
        from {{ source('sap_adw', 'currency') }}
    )

select *
from currency
