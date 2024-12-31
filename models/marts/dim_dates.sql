--- DIM_DATES gerada com auxilio do Gemini

{{ config(materialized='table') }}

WITH ALL_DATES AS (

    SELECT
        DATEADD(day, SEQ4(), '2000-01-01') AS date_key
    FROM TABLE(GENERATOR(ROWCOUNT => 36525)) 
),

DATE_DIMENSIONS AS (

    SELECT
        date_key,
        DATE(date_key) AS date,
        YEAR(date_key) AS year,
        MONTH(date_key) AS month,
        DAY(date_key) AS day,
        DAYOFWEEK(date_key) AS day_of_week, 
        TO_CHAR(date_key, 'Day') AS day_of_week_name,
        WEEKOFYEAR(date_key) AS week_of_year,
        MONTHNAME(date_key) AS month_name,
        QUARTER(date_key) AS quarter,
        CONCAT(CAST(YEAR(date_key) AS VARCHAR), LPAD(CAST(MONTH(date_key) AS VARCHAR), 2, '0')) AS year_month,
        CASE
            WHEN MONTH(date_key) IN (1, 2, 3) THEN 1
            WHEN MONTH(date_key) IN (4, 5, 6) THEN 2
            WHEN MONTH(date_key) IN (7, 8, 9) THEN 3
            ELSE 4
        END AS quarter_of_year,
       

    FROM ALL_DATES

)

SELECT * FROM DATE_DIMENSIONS