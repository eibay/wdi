var http = require("http");
var fs = require("fs");

var server = http.createServer(function(request, response){


response.end(fs.fileReadSync("./tree.html"))
})

server.listen(2000);