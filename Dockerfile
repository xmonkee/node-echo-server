FROM	node:alpine

WORKDIR /src

COPY	echo-server.js /src

EXPOSE	8080
CMD	["node", "echo-server.js"]
