SELECT * 
FROM {{ source('air_force', 'staging_flights_filtered_by_airports_raw') }}