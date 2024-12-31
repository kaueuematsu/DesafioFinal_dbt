{{ config(materialized='table') }}

with 
    person as (
        SELECT
            businessentityid as business_entity_id
            , persontype as person_type
            , namestyle as name_style
            , title as title
            , firstname as first_name
            , middlename as middle_name
            , lastname as last_name
            , suffix as suffix
            , emailpromotion as email_promotion
            , additionalcontactinfo as additional_contact_info
            , demographics as demographics
            , rowguid as rowgu_id
            , cast(modifieddate as datetime) as modified_date
        FROM {{ source('sap_adw', 'person') }}
    )

select *
from person