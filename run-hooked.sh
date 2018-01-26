#!/bin/bash
REPOSITORY=polyverse/readhook
RELEASE_TAG=$1

if [[ "$RELEASE_TAG" == "" ]]; then
	RELEASE_TAG=jenkins
fi

# Get a copy of makeload.so and readhook.so
wget -q -O /tmp/makeload.so https://github.com/$REPOSITORY/releases/download/$RELEASE_TAG/makeload.so
wget -q -O /tmp/readhook.so https://github.com/$REPOSITORY/releases/download/$RELEASE_TAG/readhook.so

#cp ../readhook/makeload.so /tmp/makeload.so
#cp ../readhook/readhook.so /tmp/readhook.so

# Run with the readhook.so set as LD_PRELOAD
docker run -it --rm --name echo -p 8080:8080 -v /tmp/makeload.so:/tmp/makeload.so -v /tmp/readhook.so:/tmp/readhook.so -e LD_PRELOAD="/tmp/makeload.so /tmp/readhook.so" polyverse/node-echo-server
