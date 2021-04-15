#!/usr/bin/env bash

podman exec -ti etherpad-edu cat settings.json | tee settings.json
