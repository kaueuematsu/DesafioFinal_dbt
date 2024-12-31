{{ config(materialized='table') }}

with 
    personcreditcard as (
        SELECT
            businessentityid as business_entity_id
            , creditcardid as credit_card_id
            , cast(modifieddate as datetime) as modified_date
        FROM {{ source('sap_adw', 'personcreditcard') }}
    )

select *
from personcreditcard