FROM	node:alpine

WORKDIR /
RUN	apk update

WORKDIR /src

COPY	echo-server.js /src

EXPOSE	8080
CMD	node /src/echo-server.js
