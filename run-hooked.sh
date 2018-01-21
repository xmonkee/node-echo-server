#!/bin/bash

# Get a copy of readhook.so
wget -q -O /tmp/readhook.so https://github.com/polyverse/readhook/releases/download/v0.0.0/readhook.so

# Run with the readhook.so set as LD_PRELOAD
docker run -it --rm --name echo -p 8080:8080 -v /tmp/readhook.so:/tmp/readhook.so -e LD_PRELOAD=/tmp/readhook.so polyverse/node-echo-server
