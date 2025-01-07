with
    employee as (
        select
            cast(businessentityid as int) as pk_employee
            , cast(jobtitle as varchar) as job_title
            , cast(gender as varchar) as gender
            , cast(hiredate as date) as hire_date
            /* nationalidnumber 
            loginid
            birthdate
            maritalstatus
            salariedflag
            vacationhours
            sickleavehours
            currentflag
            organizationnode
            rowguid
            modifiedate */           
        from {{ source('sap_adw', 'employee') }}
    )
select *
from employee
