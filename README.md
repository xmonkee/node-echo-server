# node-echo-server
Docker node.js echo-server repository.

## Running
```
docker run -d --rm --name echo -p 8080:8080 polyverse/node-echo-server
```

## Stopping
```
docker kill echo
```

## Running manually (equivalent to automated running described above).
```
docker run -it --rm --name echo -p 8080:8080 polyverse/node-echo-server /bin/sh

node echo-server.js
```

## Running manually w/readhook (adds and then runs with readhook )
```
docker run -it --rm --name echo -p 8080:8080 polyverse/node-echo-server /bin/sh

apk update && apk add wget ca-certificates && update-ca-certificates

wget -q -O /tmp/readhook.so https://github.com/polyverse/readhook/releases/download/v0.0.0/readhook.so

LD_PRELOAD=/tmp/readhook.so node echo-server.js
```

## Running manually w/readhook (adds and then runs with readhook )
```
docker run -it --rm --name echo -p 8080:8080 polyverse/node-echo-server /bin/sh

apk update && apk add wget ca-certificates && update-ca-certificates

wget -q -O /tmp/readhook.so https://github.com/polyverse/readhook/releases/download/v0.0.0/readhook.so

LD_PRELOAD=/tmp/readhook.so node echo-server.js
```
