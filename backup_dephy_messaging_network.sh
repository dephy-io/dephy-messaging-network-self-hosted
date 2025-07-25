#!/bin/bash

set -e

# 1. Set database to permanently read-only (persists after restart)
echo "Setting database to permanently read-only..."
docker-compose -f dephy-messaging-network-prod/docker-compose.yml exec -T postgresql psql -U dephy -d dephy_messaging_network -c "ALTER DATABASE dephy_messaging_network SET default_transaction_read_only = on;"

# 2. Terminate all existing connections
echo "Terminating all existing connections..."
docker-compose -f dephy-messaging-network-prod/docker-compose.yml exec -T postgresql psql -U dephy -d dephy_messaging_network -c "SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname = 'dephy_messaging_network' AND pid <> pg_backend_pid();"

# 3. Stop PostgreSQL service
echo "Stopping PostgreSQL service..."
docker-compose -f dephy-messaging-network-prod/docker-compose.yml stop postgresql

# 4. Find data volume path
VOLUME=$(docker volume ls --format '{{.Name}}' | grep dephy-messaging-network-prod_postgresql_data)
VOLUME_PATH=$(docker volume inspect $VOLUME --format '{{.Mountpoint}}')

# 5. Copy data directory
BACKUP_PATH="$(pwd)/dephy_messaging_network_backup_$(date +%Y%m%d_%H%M%S)"
echo "Copying data directory to $BACKUP_PATH ..."
sudo rsync -a "$VOLUME_PATH/" "$BACKUP_PATH/"

# 6. Restart PostgreSQL service
echo "Starting PostgreSQL service..."
docker-compose -f dephy-messaging-network-prod/docker-compose.yml start postgresql

# 7. Set database back to writable
echo "Setting database back to writable..."
docker-compose -f dephy-messaging-network-prod/docker-compose.yml exec -T postgresql psql -U dephy -d dephy_messaging_network -c "ALTER DATABASE dephy_messaging_network SET default_transaction_read_only = off;"

echo "Backup completed successfully! Database is now writable again." 