FROM	arm32v7/node

WORKDIR /src

COPY	echo-server.js /src

EXPOSE	8080
CMD	node /src/echo-server.js
