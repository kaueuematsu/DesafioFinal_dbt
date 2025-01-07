with
    address as (
        select
            cast(addressid as int) as pk_address
            , addressline1 as address_line1
            , addressline2 as address_line2
            , city as city
            , cast(stateprovinceid as int) as fk_state_province
            , postalcode as postalcode
            , spatiallocation as spatial_location
            , rowguid as rowgu_id
            , cast(modifieddate as datetime) as modified_date
        FROM {{ source('sap_adw', 'address') }}
    )

select *
from address
