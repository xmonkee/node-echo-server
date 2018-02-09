#!/bin/bash

buildtarget()
{
	command="docker build --no-cache -t polyverse/node-echo-server -t internal.hub.polyverse.io/node-echo-server ."
	echo $command
	$command
}

	buildtarget "$@"

if [ "$1" == "-p" ]; then
	docker push polyverse/node-echo-server
	docker push internal.hub.polyverse.io/node-echo-server
fi
