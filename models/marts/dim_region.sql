with 
    stg_sales_order_header as (
        select 
            distinct(fk_ship_to_address)
        from {{ref('stg_sales_order_header')}}
    )

    , stg_address as (
        select
            pk_address
            , address_line1
            , address_line2
            , city
            , fk_state_province
            , postalcode
        from {{ref('stg_address')}}
    )

    , stg_state_province as (
        select
            pk_state_province
            , state_province_code
            , fk_country_region_code
            , is_only_state_province_flag
            , name
            , fk_territory
        from {{ref('stg_state_province')}}
    )

    , stg_country_region as (
        select
            pk_country_region_code
            , name
        from {{ref('stg_country_region')}}
    )

    , dim_region as (
        select
            {{ dbt_utils.generate_surrogate_key(
                        ['fk_ship_to_address']
                    )
                }} as sk_ship_to_address
            , stg_sales_order_header.fk_ship_to_address 
            , stg_address.city as city
            , stg_state_province.name as state
            , stg_country_region.name as country
        from stg_sales_order_header
        left join stg_address on stg_sales_order_header.fk_ship_to_address = stg_address.pk_address
        left join 	stg_state_province on stg_address.fk_state_province = stg_state_province.pk_state_province
        left join stg_country_region on stg_state_province.fk_country_region_code = stg_country_region.pk_country_region_code 
    )

select *
from dim_region