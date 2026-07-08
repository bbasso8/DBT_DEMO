WITH trips AS (

    SELECT DISTINCT
        ride_id,
        rideable_type,
        DATE(TO_TIMESTAMP(started_at)) as trip_date,
        start_statio_id as start_station_id,
        end_station_id,
        member_csual as member_casual,
        TIMESTAMPDIFF(SECOND, TO_TIMESTAMP(STARTED_AT), TO_TIMESTAMP(ENDED_AT)) AS TRIP_DURATION_SECONDS
    FROM
    {{ source('demo', 'bike') }}
    WHERE 
        ride_id != 'ride_id'

)

select * from trips