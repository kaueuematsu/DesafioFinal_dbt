{{ config(materialized='table') }}

with 
    salesorderheadersalesreason as (
        SELECT
            salesorderid as sales_order_id
            , salesreasonid as sales_reason_id
            , cast(modifieddate as datetime) as modified_date
        FROM {{ source('sap_adw', 'salesorderheadersalesreason') }}
    )

select *
from salesorderheadersalesreason