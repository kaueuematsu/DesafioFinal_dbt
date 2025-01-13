with
    employee as (
        select
            pk_employee
            , job_title
            , gender
            , hire_date 
        from {{ ref('stg_employee') }}
    )

    , sales_person as (
        select
            pk_sales_person as id_sales_person
            , fk_territory 
            , sales_quota
            , bonus
            , sales_ytd
            , sales_last_year
        from {{ref('stg_sales_person')}}
    )

    , dim_sales_person as (
        select 
           {{ dbt_utils.generate_surrogate_key(
                    ['id_sales_person']
                )
            }} as sk_sales_person
            , sales_person.id_sales_person
            , employee.job_title
            , employee.gender
            , sales_person.sales_quota
            , sales_person.sales_ytd
            , sales_person.sales_last_year
        from sales_person
        left join employee on employee.pk_employee = sales_person.id_sales_person
    )

select *
from dim_sales_person
