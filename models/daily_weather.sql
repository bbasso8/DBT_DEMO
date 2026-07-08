WITH daily_weather AS (
    SELECT 
        DATE(TIME) AS daily_weather,
        weather,
        temp,
        pressure,
        humidity,
        clouds
    FROM
    {{source('demo','weather')}}

),

daily_weather_agg as (

    select
    daily_weather,
    weather,
    count(weather),
     round(avg(temp),2) avg_temp,
        round(avg(pressure),2) avg_pressure,
        round(avg(humidity),2) avg_humidity,
        round(avg(clouds),2) avg_clouds,   
         ROW_NUMBER() OVER(PARTITION BY weather ORDER BY count(weather) DESC ) AS row_number
    from daily_weather 
    group by daily_weather, weather

    qualify ROW_NUMBER() OVER(PARTITION BY weather ORDER BY count(weather) DESC ) = 1
)

SELECT
    *
FROM
    daily_weather_agg