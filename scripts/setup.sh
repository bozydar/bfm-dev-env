#!/usr/bin/env bash
set -e
echo "Starting postgres..."
docker compose up -d db
echo "Building and starting services..."
docker compose build
docker compose up -d
echo "All services running!"
