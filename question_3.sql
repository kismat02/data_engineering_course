select count(*)
from public.yellow_taxi_trips
where to_char(tpep_pickup_datetime, 'YYYY-mm-dd') = '2021-01-15';
