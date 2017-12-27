FROM	node:alpine

WORKDIR /src
COPY	package.json .
COPY	hello-world.js .
RUN	npm install

EXPOSE	8080
CMD	["node", "/src/hello-world.js"]
