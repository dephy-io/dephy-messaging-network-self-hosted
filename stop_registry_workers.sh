#!/bin/bash

set -e

echo "Stopping registry worker containers: poo-archiver, poo-pinger, poo-checker..."
docker stop dephy-worker-registry-poo-archiver-1 dephy-worker-registry-poo-pinger-1 dephy-worker-registry-poo-checker-1

echo "All specified worker services have been stopped." 