with flights_data as(
    select*
    from {{ref('flights_filtered_by_airports_cleaned')}}),
weather_data as(
    select*
    from {{ref('staging_weather_daily')}}),
flights_weather_joined as(
    (select*
    from flights_data fc
    join weather_data wd
    on (fc.origin = wd.airport_code or fc.dest = wd.airport_code)
    and fc.flight_date = wd.date
    order by flight_date asc))
select*
from flights_weather_joined