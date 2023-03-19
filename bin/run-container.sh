#! /bin/bash
set -exuo pipefail

# apiディレクトリのコンテナを起動
echo "Starting api container..."
(cd api && docker compose up -d)

# fronendディレクトリのコンテナを起動
echo "Starting frontend container..."
(cd frontend && docker compose up -d)

echo "Container started successfully!"