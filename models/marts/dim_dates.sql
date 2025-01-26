-- DIM_DATES criada com auxílio do Gemini

with recursive date_cte as (
    select 
        cast('2010-01-01' as date) as date 
    union all
    select 
        date + interval '1 day' 
    from date_cte
    where date < '2016-12-31'
)

, iso_calculations as (
    select 
        date,
        year(date) as calendar_year,
        case 
            when date_part('dow', date) = 0 then 7 
            else date_part('dow', date) 
        end as iso_day_of_week,
       
        dateadd(day, -1 * (case 
                                when date_part('dow', date) = 0 then 6 
                                else date_part('dow', date) - 1 
                           end), date) as iso_week_start
    from date_cte
)

select 
    cast(to_char(date, 'YYYYMMDD') as int) as date_key,
    date, 
    calendar_year as year, 
    extract(month from date) as month, 
    to_char(date, 'Month') as month_name, 
    extract(day from date) as day, 
    iso_day_of_week as day_of_week, 
    to_char(date, 'Day') as day_name,
    extract(quarter from date) as quarter, 
  
    floor((date - date_trunc('year', iso_week_start)) / 7) + 1 as iso_week,
   
    case 
        when month(iso_week_start) = 12 and iso_week = 1 then calendar_year + 1
        when month(iso_week_start) = 1 and iso_week >= 52 then calendar_year - 1
        else calendar_year
    end as iso_year,
    case 
        when iso_day_of_week >= 6 then 'Weekend' 
        else 'Weekday' 
    end as day_type 
from iso_calculations
order by date
