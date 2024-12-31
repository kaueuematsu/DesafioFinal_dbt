{{ config(materialized='table') }}

with 
    salesreason as (
        SELECT
            salesreasonid as sales_reason_id
            , name as name
            , reasontype as reason_type
            , cast(modifieddate as datetime) as modified_date
        FROM {{ source('sap_adw', 'salesreason') }}
    )

select *
from salesreason