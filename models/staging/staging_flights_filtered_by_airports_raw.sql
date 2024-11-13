with staging_flights_filtered_by_airports_raw as (
    SELECT * 
    FROM {{ source('staging_flights_filtered_by_airports_raw', 'flights_filtered_by_airports_raw') }})
select*
from staging_flights_filtered_by_airports_raw