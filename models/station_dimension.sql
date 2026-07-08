WITH bike AS (

    SELECT DISTINCT
        start_statio_id as station_id,
        start_station_name as station_name,
        start_lat,
        start_lng,
    FROM
{{ ref('stg_bike') }}    WHERE 
        ride_id != 'ride_id'

)

SELECT 
*
FROM bike