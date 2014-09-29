var http = require('http');
var url = require('url');
var request = require('request');
var fs = require('fs');

var server = http.createServer(function(request, response) {
  path = request.url
  console.log(request.url);

  if (path == "/") {
    var html = fs.readFileSync("./index.html");
    response.end(html);
  }
  else if (path == "/data.js") {
    response.end(fs.readFileSync("./data.js"));
  }
});

server.listen(2000);