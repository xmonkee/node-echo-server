#!/bin/bash
SHORT_DESCRIPTION="Docker run command for polyverse/node-echo-server"

USAGE="$(cat <<EOF

Usage: sh run.sh ${0##*/}

$SHORT_DESCRIPTION

EOF
)"

if [ $# -ne 0 ]; then
  printf "$USAGE\n\n"
  exit 1
fi

# Use this command to run
docker run -d --rm --name node-echo-server -p 8080:8080 polyverse/node-echo-server
