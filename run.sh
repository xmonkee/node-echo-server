#!/bin/bash
docker run -it --rm --name echo -p 8080:8080 polyverse/node-echo-server $1
