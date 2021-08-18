#!/usr/bin/env bash

podman run --detach \
  --name etherpad-edu \
  --restart always \
  --network host \
  --env-file env.list \
  --volume etherpad_data:/opt/etherpad-lite/var \
  docker.io/wenkshi/etherpad-edu
