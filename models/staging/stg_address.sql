with
    address as (
        select
            cast(addressid as int) as pk_address
            , cast(stateprovinceid as varchar) as fk_state_province
            , addressline1 as address_line1
            , city
        FROM {{ source('sap_adw', 'address') }}
    )

select *
from address
