with
    specialofferproduct as (
        select
            cast(specialofferid as int) as pk_special_offer
            , cast(productid as int) as fk_product
            , rowguid as rowgu_id
            , cast(modifieddate as datetime) as modified_date
        from {{ source('sap_adw', 'specialofferproduct') }}
    )

select *
from specialofferproduct
