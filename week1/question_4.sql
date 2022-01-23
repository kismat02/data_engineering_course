select
	to_char(tpep_dropoff_datetime, 'YYYY-mm-dd'),
	MAX(tip_amount)
from public.yellow_taxi_trips
group by 1
order by 2 desc;
