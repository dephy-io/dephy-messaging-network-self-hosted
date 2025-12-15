# Self-Hosted dephy-worker-registry

## Local Postgres

```bash
export DEPHY_WR_KEY="NOSTR KEY"
docker compose -f docker-compose.local-pg.yml up -d --pull always
```

## External Postgres

First, ensure that the database is created and the schema is migrated. Check the [migrations](./migrations) directory for the schema.

Run the following commands to start up.

```bash
export DEPHY_WR_KEY="NOSTR KEY"
export DEPHY_WR_PG_URL="PG URL"
docker compose -f docker-compose.external-pg.yml up -d --pull always
```
