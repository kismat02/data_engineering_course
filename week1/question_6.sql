select
	CONCAT(COALESCE(zones1."Zone", 'Unknown'), '/', COALESCE(zones2."Zone", 'Unknown')) as pair,
	AVG(trips.total_amount)
from public.yellow_taxi_trips trips
left join (
	select "LocationID", "Zone"
	from public.taxi_zone_lookup
) zones1
on trips."PULocationID" = zones1."LocationID"
left join (
	select "LocationID", "Zone"
	from public.taxi_zone_lookup
) zones2
on trips."DOLocationID" = zones2."LocationID"
group by 1
order by 2 desc;
