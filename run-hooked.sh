#!/bin/bash
declare -r	repository=polyverse/readhook
declare -r -a	assets=(fullhook.so basehook.so)
declare		tag=$1

declare -a	dlls=()
declare -a	vols=()
declare		args=""

# If no tag is given, use the jenkins release assets
if [[ "$tag" == "" ]]; then tag=jenkins; fi

# Get each asset and append to mounts and LD_PRELOAD environment variable.
process_asset()
{
	wget -q -O /tmp/$1 https://github.com/$repository/releases/download/$tag/$1

	dlls+=("/tmp/$1")
	vols+=("-v /tmp/$1:/tmp/$1")
}

# Process each asset in the list
for asset in ${assets[*]}; do process_asset $asset; done

# Generate the additional arguments needed for readhook
args="${vols[@]} -e LD_PRELOAD=\"${dlls[@]}\""

# run with readhook
command="docker run -it --rm --name echo -p 8080:8080 $args polyverse/node-echo-server"
echo "$command"
eval "$command"
