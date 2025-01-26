with
    store as (
        select 
            pk_store
            , fk_sales_person
            , store_name
            , annual_sales
            , annual_revenue
            , bank_name
            , business_type
            , year_opened
            , specialty
            , square_feet
            , brands
            , internet
            , number_employees
        from {{ ref('stg_store') }}
    )

    , dim_store as (
        select 
          *
        from store
    )

select *
from dim_store