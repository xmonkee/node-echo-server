#!/bin/bash

buildtarget()
{
	command="docker build -t polyverse/node-hello-world -t internal.hub.polyverse.io/node-hello-world ."
	echo $command
	$command
}

	buildtarget "$@"

if [ "$1" == "-p" ]; then
	docker push polyverse/node-hello-world
	docker push internal.hub.polyverse.io/node-hello-world
fi
