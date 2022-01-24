For this hw you need to run following scripts:

1. ```bash
    docker run -it \
        -e POSTGRES_USER="root" \
        -e POSTGRES_PASSWORD="root" \
        -e POSTGRES_DB="ny_taxi" \
        -v $(pwd)/ny_taxi_postgres_data:/var/lib/postgresql/data \
        -p 5432:5432 \
        --network=pg-network \
        --name pg-database \
        postgres:13
    ```

2. ```bash
    docker build -t taxi_ingest:v001 .
    ```

3. ```bash
    docker run -it \
    --network=pg-network \
    taxi_ingest:v001 \
    --user=root \
    --password=root \
    --host=pg-database \
    --port=5432 \
    --db=ny_taxi \
    --table_name=yellow_taxi_trips \
    --url="https://s3.amazonaws.com/nyc-tlc/trip+data/yellow_tripdata_2021-01.csv"
    ```
4. ```bash
    docker run -it --network=pg-network \
    taxi_ingest:v001 \
    --user=root \
    --password=root \
    --host=pg-database \
    --port=5432 \
    --db=ny_taxi \
    --table_name=taxi_zone_lookup \
    --url="https://s3.amazonaws.com/nyc-tlc/misc/taxi+_zone_lookup.csv" \
    --is_zone_data=1
    ```
4. ```bash
    docker run -it \
        -e PGADMIN_DEFAULT_EMAIL="admin@admin.com" \
        -e PGADMIN_DEFAULT_PASSWORD="root" \
        -p 8080:80 \
        --network=pg-network \
        --name pgadmin \
        dpage/pgadmin4
    ```

Or just use `docker-compose up` and ingest data in PG and use PGAdmin.
