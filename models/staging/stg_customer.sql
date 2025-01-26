with
    customer as (
        select
            cast(customerid as int) as pk_customer
            , cast(personid as int) as fk_person
            , cast(storeid as int) as fk_store
            , cast(territoryid as int) as fk_territory
        FROM {{ source('sap_adw', 'customer') }}
    )

select *
from customer
