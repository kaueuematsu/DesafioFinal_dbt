{{ config(materialized='table') }}

with 
    salestaxrate as (
        SELECT
            salestaxrateid as sales_tax_rate_id
            , stateprovinceid as state_province_id
            , taxtype as tax_type
            , taxrate as tax_rate
            , name as name
            , rowguid as rowgu_id
            , cast(modifieddate as datetime) as modified_date
        FROM {{ source('sap_adw', 'salestaxrate') }}
    )

select *
from salestaxrate