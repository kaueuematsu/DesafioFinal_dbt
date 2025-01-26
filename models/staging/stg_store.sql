with
    store as (
        select
            cast(businessentityid as int) as pk_store         
            , cast(salespersonid as int) as fk_sales_person
            , name as store_name
            , cast(regexp_substr(demographics, '<AnnualSales>([0-9]+)</AnnualSales>', 1, 1, 'e', 1) as float) as annual_sales
            , cast(regexp_substr(demographics, '<AnnualRevenue>([0-9]+)</AnnualRevenue>', 1, 1, 'e', 1) as float) as annual_revenue
            , regexp_substr(demographics, '<BankName>([^<]+)</BankName>', 1, 1, 'e', 1) as bank_name
            , regexp_substr(demographics, '<BusinessType>([^<]+)</BusinessType>', 1, 1, 'e', 1) as business_type
            , cast(regexp_substr(demographics, '<YearOpened>([0-9]+)</YearOpened>', 1, 1, 'e', 1) as int) as year_opened
            , regexp_substr(demographics, '<Specialty>([^<]+)</Specialty>', 1, 1, 'e', 1) as specialty
            , cast(regexp_substr(demographics, '<SquareFeet>([0-9]+)</SquareFeet>', 1, 1, 'e', 1) as int) as square_feet
            , cast(regexp_substr(demographics, '<Brands>([0-9]+)</Brands>', 1, 1, 'e', 1) as int) as brands
            , regexp_substr(demographics, '<Internet>([^<]+)</Internet>', 1, 1, 'e', 1) as internet
            , cast(regexp_substr(demographics, '<NumberEmployees>([0-9]+)</NumberEmployees>', 1, 1, 'e', 1) as int) as number_employees
        from {{ source('sap_adw', 'store') }}
    )

select *
from store
