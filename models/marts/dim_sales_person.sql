with

    sales_person as (      -- Definindo a granularidade por aqui. 
        select
            *
        from {{ref('stg_sales_person')}}
    )

    , employee as (
        select
            *
        from {{ ref('stg_employee') }}
    )

    , person as (
        select
            *
        from {{ref('stg_person')}}
    )

    , dim_sales_person as (
        select
            sales_person.id_sales_person as pk_sales_person
            , person.id_person
            , person.full_name
            , person.person_type
            , employee.job_title
            , employee.gender
            , employee.vacation_hours
            , employee.sick_hours
            , sales_person.sales_quota
            , sales_person.bonus
            , sales_person.commission_pct
            , sales_person.sales_ytd
            , sales_person.sales_last_year
            , sales_person.id_territory
        from sales_person
        left join employee on employee.id_employee = sales_person.id_sales_person
        left join person on person.id_person = employee.id_employee
    )

select *
from dim_sales_person
