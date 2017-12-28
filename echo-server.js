var http = require('http');

http.createServer(function (request, response) {
    response.write(request.url);
    response.end();
    return;
}).listen(8080);
