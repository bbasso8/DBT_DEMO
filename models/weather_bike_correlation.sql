WITH CTE AS (
    SELECT
    t.*,
    w.*
    FROM
    {{ ref('trip_fact') }} t 
    LEFT JOIN {{ ref('daily_weather') }} w 
    ON t.trip_date = w.daily_weather
    order by trip_date desc

    
)

select 
*
FROM CTE