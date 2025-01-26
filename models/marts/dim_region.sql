with 
    orderheader as (
        select
            distinct(fk_shipment)
        from {{ref('stg_sales_order_header')}}
    )

    , stg_address as (
        select
            *
        from {{ref('stg_address')}}
    )

    , state_province as (
        select
            *
        from {{ref('stg_state_province')}}
    )

    , country_region as (
        select
            *
        from {{ref('stg_country_region')}}
    )

    , dim_region as (
        select
            {{ dbt_utils.generate_surrogate_key(
                        ['fk_shipment']
                    )
                }} as sk_region
               , orderheader.fk_shipment
               , country_region.country
               , state_province.state_name
               , stg_address.city 
        from orderheader
        left join stg_address on orderheader.fk_shipment = stg_address.pk_address
        left join state_province on stg_address.fk_state_province = state_province.pk_state_province
        left join country_region on state_province.fk_country_region = country_region.pk_country_region_code
    )

select *
from dim_region