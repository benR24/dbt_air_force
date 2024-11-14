with flights_filtered_by_airports_raw as (
    select*
    from {{ref('staging_flights_filtered_by_airports_raw')}}),
flights_filtered_by_airports_cleaned as(
    select
        to_date(flight_date, 'YYYY-MM-DD') as flight_date,
        TO_CHAR(dep_time, 'fm0000')::TIME AS dep_time,
        TO_CHAR(sched_dep_time , 'fm0000')::TIME AS sched_dep_time,
        dep_delay,
        TO_CHAR(arr_time , 'fm0000')::TIME AS arr_time,
        TO_CHAR(sched_arr_time , 'fm0000')::TIME AS sched_arr_time,
        arr_delay,
        airline,
        tail_number,
        flight_number,
        origin,
        dest,
        air_time,
        actual_elapsed_time,
        (distance / 0.621371)::NUMERIC(6,2) AS distance_km,
        cancelled,
        diverted
    from flights_filtered_by_airports_raw)
select*
from flights_filtered_by_airports_cleaned