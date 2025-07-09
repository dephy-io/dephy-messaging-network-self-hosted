# Self-Hosted dephy-messaging-network

## Local Postgres

```bash
export DEPHY_MN_KEY="NOSTR KEY"
docker compose -f docker-compose.local-pg.yml up -d --pull always
```

## External Postgres

First, ensure that the database is created and the schema is migrated. Check the [migrations](./migrations) directory for the schema.

Also ensure that the user specified in `PROMETHEUS_POSTGRES_EXPORTER_DATA_SOURCE_USER` has the `pg_read_all_stats` privilege.

Run the following commands to start up.

```bash
export DEPHY_MN_KEY="NOSTR KEY"
export DEPHY_MN_PG_URL="PG URL"
export PROMETHEUS_POSTGRES_EXPORTER_DATA_SOURCE_URI="PG URI"
export PROMETHEUS_POSTGRES_EXPORTER_DATA_SOURCE_USER="PG USER"
export PROMETHEUS_POSTGRES_EXPORTER_DATA_SOURCE_PASS="PG PASS"
docker compose -f docker-compose.external-pg.yml up -d --pull always
```
