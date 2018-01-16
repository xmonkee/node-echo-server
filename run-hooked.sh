#!/bin/bash

# Get a copy of redhook.so
wget -q -O /tmp/redhook.so https://github.com/polyverse-security/redhook/releases/download/v0.0.0/redhook.so

# Run with the redhook.so set as LD_PRELOAD
docker run -d --rm --name echo -p 8080:8080 -v /tmp/redhook.so:/tmp/redhook.so -e LD_PRELOAD=/tmp/redhook.so polyverse/node-echo-server
