{{ config(materialized='table') }}

with 
    customer as (
        SELECT
            customerid as customer_id
            , personid as person_id
            , storeid as store_id
            , territoryid as territory_id
            , rowguid as rowgu_id
            , cast(modifieddate as datetime) as modified_date
        FROM {{ source('sap_adw', 'customer') }}
    )

select *
from customer