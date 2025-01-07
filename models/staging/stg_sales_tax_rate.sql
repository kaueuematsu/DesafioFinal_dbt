with 
    salestaxrate as (
        select
            cast(salestaxrateid as int) as pk_sales_tax_rate
            , cast(stateprovinceid as int) as fk_state_province
            , taxtype as tax_type
            , taxrate as tax_rate
            , name as name
            , rowguid as rowgu_id
            , cast(modifieddate as datetime) as modified_date
        FROM {{ source('sap_adw', 'salestaxrate') }}
    )

select *
from salestaxrate
