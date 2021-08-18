#!/usr/bin/env bash

podman run --detach \
  --name postgres \
  --restart always \
  --network host \
  --env-file db_env.list \
  --volume postgres_data:/var/lib/postgresql/data \
  postgres
