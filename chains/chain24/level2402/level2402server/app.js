const http = require('http');
const os = require('os');

console.log("web server start");

var handler = function(request, response) {
    console.log("Recived request from" + request.connection.remoteAddress);
    response.writeHead(200);
    response.end("You've hit" + os.hostname() + "\n");
};
var www = http.createServer(handler);
www.listen(8080);
