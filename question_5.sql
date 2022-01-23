select COALESCE("Zone", 'Unknown'), count(*)
from public.yellow_taxi_trips trips
join (
	select "LocationID", "Zone"
	from public.taxi_zone_lookup
) zones
on trips."DOLocationID" = zones."LocationID"
group by 1
order by 2 desc;
