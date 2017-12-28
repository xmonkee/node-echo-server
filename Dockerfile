FROM	node:alpine

WORKDIR /src

COPY	echo-server.js .

EXPOSE	8080
CMD	["node", "echo-server.js"]
