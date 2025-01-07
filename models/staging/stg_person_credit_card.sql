with
    personcreditcard as (
        select
            cast(businessentityid as int) as pk_person_credit_card
            , cast(creditcardid as int) as fk_credit_card
            , cast(modifieddate as datetime) as modified_date
        from {{ source('sap_adw', 'personcreditcard') }}
    )

select *
from personcreditcard
