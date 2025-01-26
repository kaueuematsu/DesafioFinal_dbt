with
    person as (
        select
            cast(businessentityid as int) as id_person
            , case
                 when persontype = 'SC' then 'Store Client'
                 when persontype = 'IN' then 'Retail Client'
                 when persontype = 'SP' then 'Sales Person'
                 when persontype = 'EM' then 'General Employee'
                 when persontype = 'VC' then 'Supplier'
                 when persontype = 'GC' then 'General Contact'
                 else null
              end as person_type
            , concat(ifnull(firstname,' '),' ',ifnull(middlename,' '),' ',ifnull(lastname,' ')) as full_name
            , cast(emailpromotion as int) as email_promotion
            , cast(regexp_substr(demographics, '<TotalPurchaseYTD>(-?[0-9.]+)</TotalPurchaseYTD>', 1, 1, 'e', 1) as float) as total_purchase_ytd -- SEGMENTAR FAIXAS DE CLIENTES
        FROM {{ source('sap_adw', 'person') }}
    )
select *
from person