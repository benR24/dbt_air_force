with flights_filtered_by_airports_raw as (
    select*
    from {{ref('staging_flights_filtered_by_airports_raw')}}),
flights_filtered_by_airports_cleaned as(
    select
        flight_date,
        TO_CHAR(dep_time, 'fm0000')::TIME AS dep_time,
        TO_CHAR(sched_dep_time , 'fm0000')::TIME AS sched_dep_time,
        (dep_delay * '1 minute'::INTERVAL) AS dep_delay_interval,
        TO_CHAR(arr_time , 'fm0000')::TIME AS arr_time,
        TO_CHAR(sched_arr_time , 'fm0000')::TIME AS sched_arr_time,
        (arr_delay * '1 minute'::INTERVAL) AS arr_delay_interval,
        airline,
        tail_number,
        flight_number,
        origin,
        dest,
        air_time,
        (air_time * '1 minute'::INTERVAL) AS air_time_interval,
        actual_elapsed_time,
        (actual_elapsed_time * '1 minute'::INTERVAL) AS actual_elapsed_time_interval,
        (distance / 0.621371)::NUMERIC(6,2) AS distance_km,
        cancelled,
        diverted
    from flights_filtered_by_airports_raw)
select*
from flights_filtered_by_airports_cleaned