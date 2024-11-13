with staging_flights_filtered_by_airports_raw as (
SELECT * 
FROM {{ source('air_force', 'flights_filtered_by_airports_raw') }})