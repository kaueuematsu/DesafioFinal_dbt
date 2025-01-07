with
    person as (
        select
            cast(businessentityid as int) as pk_person
            , persontype as person_type
            , namestyle as name_style
            , title as title
            , concat(ifnull(firstname,' '),' ',ifnull(middlename,' '),' ',ifnull(lastname,' ')) as full_name
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