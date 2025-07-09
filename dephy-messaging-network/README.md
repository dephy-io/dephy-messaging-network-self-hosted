# Self-Hosted dephy-messaging-network

## Local Postgres

```bash
export DEPHY_MN_KEY="NOSTR KEY"
docker compose -f docker-compose.local-pg.yml up -d --pull always
```

## External Postgres

```bash
export DEPHY_MN_KEY="NOSTR KEY"
export DEPHY_MN_PG_URL="PG URL"
export PROMETHEUS_POSTGRES_EXPORTER_DATA_SOURCE_URI="PG URI"
export PROMETHEUS_POSTGRES_EXPORTER_DATA_SOURCE_USER="PG USER"
export PROMETHEUS_POSTGRES_EXPORTER_DATA_SOURCE_PASS="PG PASS"
docker compose -f docker-compose.external-pg.yml up -d --pull always
```
