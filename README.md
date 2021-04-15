# etherpad-edu
Personalized container of etherpad-lite

## Build image
Build image with personalized Dockerfile
```bash
#!/usr/bin/env bash

podman build -t docker.io/wenkshi/etherpad-edu .
```

## Push image
Push the built image to docker.io
```bash
#!/usr/bin/env bash

podman push docker.io/wenkshi/etherpad-edu
```

## Run
Running etherpad-edu
```bash
#!/usr/bin/env bash

podman run --detach \
  --name etherpad-edu \
  --restart always \
  --publish 9001:9001 \
  --env-file env.list \
  --volume etherpad_data:/opt/etherpad-lite/var \
  docker.io/wenkshi/etherpad-edu
```
env.list examples
```bash
cat env.list.example
DEFAULT_PAD_TEXT=This pad text is synchronized as you type, so that everyone viewing this page sees the same text. This allows you to collaborate seamlessly on documents!
ADMIN_PASSWORD=YOUR_ADMIN_PASSWORD
USER_PASSWORD=YOUR_USER_PASSWORD
SUPPRESS_ERRORS_IN_PAD_TEXT=true
```

## Clean up
Stop etherpad-edu, destroy volume
```bash
podman stop etherpad-edu ; podman rm etherpad-edu ; podman volume rm etherpad_data
```
