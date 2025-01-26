-- DIM_DATES criada com auxílio do Gemini

with recursive date_cte as (
    select 
        cast('2010-01-01' as date) as date -- Data inicial
    union all
    select 
        date + interval '1 day' -- Incrementa 1 dia
    from date_cte
    where date < '2016-12-31' -- Data final
)

, iso_calculations as (
    select 
        date,
        year(date) as calendar_year,
        case 
            when date_part('dow', date) = 0 then 7 -- Converte domingo (0) para 7
            else date_part('dow', date) 
        end as iso_day_of_week,
        -- Calcula o primeiro dia da semana ISO (segunda-feira)
        dateadd(day, -1 * (case 
                                when date_part('dow', date) = 0 then 6 
                                else date_part('dow', date) - 1 
                           end), date) as iso_week_start
    from date_cte
)

select 
    cast(to_char(date, 'YYYYMMDD') as int) as date_key, -- Chave primária
    date, -- Data completa
    calendar_year as year, -- Ano do calendário
    extract(month from date) as month, -- Mês numérico
    to_char(date, 'Month') as month_name, -- Nome do mês
    extract(day from date) as day, -- Dia do mês
    iso_day_of_week as day_of_week, -- Dia da semana (ISO: 1 = segunda-feira, 7 = domingo)
    to_char(date, 'Day') as day_name, -- Nome do dia da semana
    extract(quarter from date) as quarter, -- Trimestre
    -- Semana ISO: Calcula a diferença entre o início da semana ISO e o primeiro dia do ano
    floor((date - date_trunc('year', iso_week_start)) / 7) + 1 as iso_week,
    -- Ano ISO: Se o ISO week_start for no próximo ou no ano anterior, ajusta o ano
    case 
        when month(iso_week_start) = 12 and iso_week = 1 then calendar_year + 1
        when month(iso_week_start) = 1 and iso_week >= 52 then calendar_year - 1
        else calendar_year
    end as iso_year,
    case 
        when iso_day_of_week >= 6 then 'Weekend' 
        else 'Weekday' 
    end as day_type -- Dia útil ou fim de semana
from iso_calculations
order by date
