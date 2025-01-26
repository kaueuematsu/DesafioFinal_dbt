with
    employee as (
        select
            cast(businessentityid as int) as id_employee
            , cast(jobtitle as varchar) as job_title
            , cast(gender as varchar) as gender
            , cast(birthdate as date) as birth_date
            , cast(hiredate as date) as hire_date
            , cast(vacationhours as int) as vacation_hours
            , cast(sickleavehours as int) as sick_hours    -- ANALISAR RH
        from {{ source('sap_adw', 'employee') }}
    )
select *
from employee
