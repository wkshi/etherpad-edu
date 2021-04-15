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

## Settings
Custom settings for installed plugin in Dockerfile
```json
{
...
  "ep_readonly_guest": {
    "guest_username": "guest",
    "guest_displayname": "Read-Only Guest"
  },
  "requireAuthentication": true,
  "ep_image_upload": {
    "fileTypes": ["jpeg", "jpg", "bmp", "gif", "png"],
    "maxFileSize": 5000000
  }
}
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

## Exec into container
Exec into the running container
```bash
#!/usr/bin/env bash

podman exec -ti etherpad-edu bash
```

# Restart container
Restart container every time when update settings
```bash
#!/usr/bin/env bash

podman stop etherpad-edu
podman start etherpad-edu
```

## Logs
View logs
```bash
#!/usr/bin/env bash

podman logs -f etherpad-edu
```

## Clean up
Stop etherpad-edu, destroy volume
```bash
podman stop etherpad-edu ; podman rm etherpad-edu ; podman volume rm etherpad_data
```
