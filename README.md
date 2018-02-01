# node-echo-server
Docker node.js echo-server repository.

## Running
```
./run.sh
# OR
docker run -d --rm --name echo -p 8080:8080 polyverse/node-echo-server
```

## Stopping
```
docker kill echo
```

## Running interactively (equivalent to automated running described above).
```
docker run -it --rm --name echo -p 8080:8080 polyverse/node-echo-server /bin/sh

node echo-server.js
```

## Running interactively w/readhook (adds and then runs with readhook)
```
docker run -it --rm --name echo -p 8080:8080 polyverse/node-echo-server /bin/sh

apk update && apk add wget ca-certificates && update-ca-certificates

wget -q -O /tmp/basehook.so https://github.com/polyverse/readhook/releases/download/v1.1.0/basehook.so
wget -q -O /tmp/fullhook.so https://github.com/polyverse/readhook/releases/download/v1.1.0/fullhook.so

LD_PRELOAD="/tmp/basehook.so /tmp/fullhook.so" node echo-server.js
```
