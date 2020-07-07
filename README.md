docker image for ClickHouse
----------------------------

Based on Arch Linux. ClickHouse should be compiled and put to `ClickHouse/build/programs/` directory. Steps for building and uploading ClickHouse image:

	docker-compose build
	docker images
	docker tag <image id> rivitli/clickhouse:stable
	docker push rivitli/clickhouse:stable

Sample `docker-compose.yml`:

```
version: '2'

services:
  clickhouse:
	image: rivitli/clickhouse:stable
    ports:
      - "8123:8123"
      - "9000:9000"
    environment:
      - TOOL=clickhouse-server
  clickhouse-client:
    network_mode: "host"
    build:
      context: .
    environment:
      - TOOL=clickhouse-client
```

`TOOL` environment variable is used to determine what to run. If nothing is specified the server will run by default.

How to test:

	docker-compose pull
	docker-compose up clickhouse -d
	docker-compose run clickhouse-client
